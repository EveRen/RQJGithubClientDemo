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
            let token = try await loginService.oAuthAuthenticate()
            let user = try await loginService.getProfileInfo(with: token, isPAT: false)
            loginAuthStatus = .isLoggedin(user)
        } catch {
            loginAuthStatus = .error(error.localizedDescription)
        }
    }
    
    @MainActor
    func loginWithPAT() async {
        loginAuthStatus = .isLogging
        do {
            let user = try await loginService.getProfileInfo(with: "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", isPAT: true)
            loginAuthStatus = .isLoggedin(user)
        } catch {
            loginAuthStatus = .error(error.localizedDescription)
        }
    }
    
    func setToCancel() {
        loginAuthStatus = .unKnown
    }
}
