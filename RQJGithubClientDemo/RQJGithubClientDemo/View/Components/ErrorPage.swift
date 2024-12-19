//
//  ErrorPage.swift
//  RQJGithubClientDemo
//
//  Created by 任泡泡🫧 on 2024/12/19.
//

import SwiftUI

struct ErrorPage: View {
    var errorMessage: String
    var onRetry: () -> Void
    var onCancel: () -> Void

    var body: some View {
        ZStack {
            Color.black.opacity(0.5)
             .edgesIgnoringSafeArea(.all)

            VStack(spacing: 20) {
                Text(AppString.errorTitle.localizedText)
                 .font(.title)
                 .foregroundColor(.white)

                Text(errorMessage)
                 .font(.body)
                 .foregroundColor(.white)
                 .multilineTextAlignment(.center)
                 .padding(.horizontal, 20)

                HStack(spacing: 20) {
                    RoundButton(buttonText: AppString.retry.localizedText, action: onRetry)
                    
                    RoundButton(buttonText: AppString.cancel.localizedText, action: onCancel)
                }
            }
         .padding()
         .frame(width: 300, height: 250)
         .background(Color.black)
         .cornerRadius(10)
         .shadow(radius: 5)
        }
    }
}
