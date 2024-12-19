//
//  RoundButton.swift
//  RQJGithubClientDemo
//
//  Created by 任泡泡🫧 on 2024/12/19.
//

import SwiftUI

struct RoundButton: View {
    var buttonText: String
    var padding: CGFloat = 10
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(buttonText)
                .font(.headline)
                .padding(padding)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
        }
    }
}
