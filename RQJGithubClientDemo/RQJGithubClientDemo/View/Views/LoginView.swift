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
    
    @State private var username = ""
    @State private var password = ""

    @State private var isAuthenticating = false
    @State private var authenticationError: Error? = nil
    @State private var loginSuccess = false
    @State private var shouldShowAlert = false
    
    var body: some View {
        switch viewModel.loginAuthStatus {
        case .unKnown:
            loginContent
            
        case .isAuthenticating:
            ProfilePageView()
            
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
            
            Text(AppString.login.localizedText)
             .font(.title)
            
            TextField("用户名", text: $username)
             .textFieldStyle(RoundedBorderTextFieldStyle())
             .padding(.horizontal, 20)
            
            SecureField("密码", text: $password)
             .textFieldStyle(RoundedBorderTextFieldStyle())
             .padding(.horizontal, 20)
            
            RoundButton(buttonText: AppString.loginWithUP.localizedText, action: loginWithGitHubAPI)
            RoundButton(buttonText: AppString.loginWithWeb.localizedText, action: loginWithGitHubAPI)
            RoundButton(buttonText: AppString.loginWithBiometry.localizedText, action: authenticate)

        }
     .padding()
    }
    
    func authenticate() {
        viewModel.authenticateUser()
    }
    
    func loginWithGitHubAPI() {
        viewModel.startLogin()
    }
}
