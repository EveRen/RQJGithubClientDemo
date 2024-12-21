//
//  LoginView.swift
//  RQJGithubClientDemo
//
//  Created by 任泡泡🫧 on 2024/12/19.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel: LoginViewModel
    @State private var personalAccessTokens = ""
    
    var body: some View {
        switch viewModel.loginAuthStatus {
        case .unKnown:
            ScrollView { loginContent }
            
        case .isAuthenticating, .isLogging, .isAuthenticated:
            ProgressView()
            
        case .isLoggedin(let user):
            ProfilePageView(viewModel: viewModel, userInfo: user)
            
        case .error(let string):
            ErrorPage(errorMessage: string) {
                viewModel.setToCancel()
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
            await viewModel.loginWithPAT(personalAccessTokens)
        }
    }
}
