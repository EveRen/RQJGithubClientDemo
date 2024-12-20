//
//  LoginView.swift
//  RQJGithubClientDemo
//
//  Created by 任泡泡🫧 on 2024/12/19.
//

import SwiftUI
import Combine
import LocalAuthentication

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    
    @State private var personalAccessTokens = ""

    @State private var isAuthenticating = false
    @State private var authenticationError: Error? = nil
    @State private var loginSuccess = false
    @State private var shouldShowAlert = false
    
    var body: some View {
        switch viewModel.loginAuthStatus {
        case .unKnown:
            ScrollView { loginContent }
            
        case .isAuthenticating, .isLogging:
             ProgressView()
            
        case .isAuthenticated:
            ProfilePageView()
            
        case .isLoggedin:
            Color.red
            
        case .error(let string):
            ErrorPage(errorMessage: string) {
                
            } onCancel: {
                viewModel.setToCancel()
            }
        }
    }
    
    var loginContent: some View {
        VStack(spacing: 20) {
            Image("logo")
             .resizable()
             .aspectRatio(contentMode:.fit)
             .frame(width: 100, height: 100)
             .padding(.vertical, 20)
            
            Text(AppString.login.localizedText)
                .font(.title)
            Text(AppString.loginDetail.localizedText)
                .foregroundColor(.gray)
                .font(.footnote)
            // oAuth 登录
            RoundButton(buttonText: AppString.loginWithWeb.localizedText, action: loginWithGitHubAPI)
            SecureField(AppString.personalAccessTokens.localizedText, text: $personalAccessTokens)
             .textFieldStyle(RoundedBorderTextFieldStyle())
             .padding(.horizontal, 20)
            // PAT 登录
            RoundButton(buttonText: AppString.loginWithPAT.localizedText, action: loginWithPAT)
            // 生物认证
            RoundButton(buttonText: AppString.loginWithBiometry.localizedText, action: biometryAuthenticate)
            Text(AppString.loginWithBiometryDetail.localizedText)
                .foregroundColor(.gray)
                .font(.footnote)
            Spacer()

        }
     .padding()
    }
    
    func biometryAuthenticate() {
        Task {
            await viewModel.biometryAuthenticate()
        }
    }
    
    func loginWithGitHubAPI() {
        Task {
            await viewModel.oAuthAuthenticate()
        }
    }
    
    func loginWithPAT() {
        Task {
            await viewModel.loginWithPAT()
        }
    }
}
