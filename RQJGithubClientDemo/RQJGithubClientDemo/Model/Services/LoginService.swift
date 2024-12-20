//
//  LoginService.swift
//  RQJGithubClientDemo
//
//  Created by 任泡泡🫧 on 2024/12/19.
//

import AuthenticationServices
import Foundation
import LocalAuthentication
import UIKit

protocol LoginServiceProtocol {
    // 生物认证
    func biometryAuthenticate() async throws -> Bool
    
    func oAuthAuthenticate() async throws -> String
    
    // 获取 User Profile 信息
    func getProfileInfo(with token: String, isPAT: Bool) async throws -> User
}

class LoginService: NSObject, LoginServiceProtocol {
    func biometryAuthenticate() async throws -> Bool {
        let context = LAContext()
            var error: NSError?
            // 检查设备是否支持生物识别
            guard context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) else {
                throw errorWithMsg("设备不支持生物识别或无生物特征")
            }
        try await context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "请使用生物识别验证您的身份")
        return true
    }
    
    // 相对敏感数据 使用base64编码
    private let clientIdBase64 = "T3YyM2xpMWdTcWtBcXJQcVRleVQ="
    private let clientSecretBase64 = "Y2U0N2NjZWJjNGU0OTAwZWIxYmU1MTE3MTk1NDg1MmQ2MzllMTY0Mw=="
    private let redirectURI = "RQJGithubClientDemo://github-callback"
    private let customScheme = "RQJGithubClientDemo"
    
    // OAuth 2.0 认证
    @MainActor
    func oAuthAuthenticate() async throws -> String {
        guard let clientId = clientIdBase64.base64Decoded(),
              let clientSecret = clientSecretBase64.base64Decoded() else {
            throw NSError(domain: "ErrorDomain", code: 1001, userInfo: [NSLocalizedDescriptionKey: "解码客户端ID或密钥失败"])
        }
        
        guard let authURL = URL(string: "https://github.com/login/oauth/authorize?client_id=\(clientId)&redirect_uri=\(redirectURI)") else {
            throw URLError(.badURL)
        }
        
        return try await withCheckedThrowingContinuation { continuation in
                let session = ASWebAuthenticationSession(url: authURL, callbackURLScheme: customScheme) { (url, error) in
                    if let error = error {
                        continuation.resume(throwing: error)
                    } else if let url = url {
                        let code = self.getAuthorizationCode(from: url)
                        continuation.resume(returning: code ?? "")
                    } else {
                        continuation.resume(throwing: URLError(.badURL))
                    }
                    
                }
                session.presentationContextProvider = self
                session.start()
            }
    }
    
    private func getAuthorizationCode(from url: URL) -> String? {
        // 从回调URL中解析授权码
        if let components = URLComponents(url: url, resolvingAgainstBaseURL: false),
           let queryItems = components.queryItems,
           let code = queryItems.first(where: { $0.name == "code" })?.value {
            return code
        }
        return nil
    }
    
    func getProfileInfo(with token: String, isPAT: Bool = true) async throws -> User {
        guard let url = URL(string: "https://api.github.com/user") else {
            throw URLError(.badURL)
        }
        var request = URLRequest(url: url)
        let valuePrefix = isPAT ? "token" : "Bearer"
        request.setValue("\(valuePrefix) \(token)", forHTTPHeaderField: "Authorization")
        let (data, _) = try await URLSession.shared.data(for: request)
        return try JSONDecoder().decode(User.self, from: data)
    }
    
    func errorWithMsg(_ msg: String) -> NSError {
        NSError(domain: "ErrorDomain", code: 1001, userInfo: [NSLocalizedDescriptionKey: msg])
    }
}

extension LoginService: ASWebAuthenticationPresentationContextProviding {
    func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
        // 获取当前应用的窗口场景
        guard let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return UIWindow()
        }
        // 获取窗口场景的代理
        guard let windowSceneDelegate = scene.delegate as? UIWindowSceneDelegate else {
            return UIWindow()
        }
        // 获取窗口
        guard let window = windowSceneDelegate.window else {
            return UIWindow()
        }
        return window!
    }
}
