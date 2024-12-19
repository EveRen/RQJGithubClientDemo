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
    @State private var isAuthenticating = false
    @State private var authenticationError: Error? = nil
    @State private var loginSuccess = false
    @State private var shouldShowAlert = false
    
    var body: some View {
        VStack {
            if isAuthenticating {
                ProgressView()
            } else {
                RoundButton(buttonText: AppString.loginWithBiometry.localizedText, action: authenticate)
                
                .alert(isPresented: $shouldShowAlert) {
                    Alert(title: Text("认证错误"), message: Text(authenticationError?.localizedDescription ?? ""), dismissButton: .default(Text("确定")))
                }
                if loginSuccess {
                    Text("登录成功！")
                        .font(.largeTitle)
                        .padding()
                }
            }
        }
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            isAuthenticating = true
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "用于登录GitHub") { success, evaluateError in
                self.isAuthenticating = false
                if let error = evaluateError {
                    self.authenticationError = error
                } else {
                    self.loginWithGitHubAPI()
                }
            }
        } else {
            authenticationError = error
        }
    }
    
    func loginWithGitHubAPI() {
        // 这里应该调用GitHub API进行登录
        // 为了示例，我们直接设置登录成功
        loginSuccess = true
    }
}


#Preview {
    LoginView()
}
