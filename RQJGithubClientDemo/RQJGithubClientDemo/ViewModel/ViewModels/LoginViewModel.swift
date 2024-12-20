//
//  LoginViewModel.swift
//  RQJGithubClientDemo
//
//  Created by 任泡泡🫧 on 2024/12/19.
//

import AuthenticationServices
import Foundation
import LocalAuthentication
import UIKit

// 相对敏感数据 使用base64编码
//private let clientId = "Ov23li1gSqkAqrPqTeyT"
//private let clientSecret = "ce47ccebc4e4900eb1be51171954852d639e1643"
private let clientIdBase64 = "T3YyM2xpMWdTcWtBcXJQcVRleVQ="
private let clientSecretBase64 = "Y2U0N2NjZWJjNGU0OTAwZWIxYmU1MTE3MTk1NDg1MmQ2MzllMTY0Mw=="
private let redirectURI = "RQJGithubClientDemo://github-callback"
private let customScheme = "RQJGithubClientDemo"

class LoginViewModel: NSObject, ObservableObject, LoginService {
    @Published var isAuthenticated: Bool = false
    @Published var loginAuthStatus: LoginAuthStatus = .unKnown
    var access_token: String = ""
    
    func authenticateUser() {
        let context = LAContext()
        var error: NSError?
        
        // 检查设备是否支持生物识别
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "请使用生物识别验证您的身份"
            DispatchQueue.main.async { self.loginAuthStatus = .isAuthenticating }
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                DispatchQueue.main.async {
                    if success {
                        // 认证成功
                        self.loginAuthStatus = .isAuthenticated
                        print("~~~~~~~~~认证成功")

                    } else {
                        // 认证失败
                        self.loginAuthStatus = .error("认证失败")
                        print("~~~~~~~~~认证失败")
                    }
                }
            }
        } else {
            // 设备不支持生物识别或无生物特征
            self.loginAuthStatus = .error("设备不支持生物识别或无生物特征")
            print("~~~~~~~~~设备不支持生物识别或无生物特征")
        }
    }
    
    func startLogin() {
        let clientId = clientIdBase64.base64Decoded()
        let clientSecret = clientSecretBase64.base64Decoded()
        let authURL = URL(string: "https://github.com/login/oauth/authorize?client_id=\(clientId)&redirect_uri=\(redirectURI)")!
                    let session = ASWebAuthenticationSession(url: authURL, callbackURLScheme: customScheme) { (url, error) in
                        if let error = error {
                            DispatchQueue.main.async { self.loginAuthStatus = .error(error.localizedDescription) }
                        } else if let url = url {
                            // 处理回调URL，获取授权码
                            let code = self.getAuthorizationCode(from: url)
                            // 使用授权码获取访问令牌等后续操作
                            print("!!~~~~~~~~code = \(code)")
                            self.loginAuthStatus = .isLoggedin
                            self.access_token = code ?? ""
                        }
                    }
                    session.presentationContextProvider = self
                    session.start()
    }
    
    func getAccessToken(fromCode code: String) async {
        
    }
    
    private func setErrorMessage(_ msg: String) {
        DispatchQueue.main.async { self.loginAuthStatus = .error(msg) }
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
    
    func setToCancel() {
        loginAuthStatus = .unKnown
    }
}

extension LoginViewModel: ASWebAuthenticationPresentationContextProviding {
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
