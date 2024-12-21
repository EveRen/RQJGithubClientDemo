//
//  LoginViewModel.swift
//  RQJGithubClientDemo
//
//  Created by 任泡泡🫧 on 2024/12/19.
//

import Foundation

class LoginViewModel: ObservableObject {
    private let loginService: LoginServiceProtocol
    @Published var isAuthenticated: Bool = false
    @Published var loginAuthStatus: LoginAuthStatus = .unKnown
    
    init(loginService: LoginServiceProtocol = LoginService()) {
        self.loginService = loginService
    }
    
    @MainActor
    func biometryAuthenticate() async {
        loginAuthStatus = .isAuthenticating
        do {
            let _ = try await loginService.biometryAuthenticate()
            loginAuthStatus = .isAuthenticated
            await loginWithPAT()
        } catch {
            loginAuthStatus = .error(error.localizedDescription)
        }
    }
    
    @MainActor
    func oAuthAuthenticate() async {
        loginAuthStatus = .isAuthenticating
        do {
            let code = try await loginService.oAuthAuthenticate()
            let token = try await loginService.fetchAccessToken(with: code)
            let user = try await loginService.getProfileInfo(with: token.access_token ?? "", isPAT: false)
            loginAuthStatus = .isLoggedin(user)
        } catch {
            loginAuthStatus = .error(error.localizedDescription)
        }
    }
    
    @MainActor
    func loginWithPAT(_ input: String? = nil) async {
        loginAuthStatus = .isLogging
        do {
            // 如果用户输入则优先使用，否则使用保存的
            let pat = (input ?? "").isEmpty ? (KeyChainStorage().loadPAT() ?? "") : (input ?? "")
            let user = try await loginService.getProfileInfo(with: pat, isPAT: true)
            loginAuthStatus = .isLoggedin(user)
            if let input = input, !input.isEmpty { KeyChainStorage().savePAT(input) }
        } catch {
            loginAuthStatus = .error(error.localizedDescription)
        }
    }
    
    func setToCancel() {
        loginAuthStatus = .unKnown
    }
}
