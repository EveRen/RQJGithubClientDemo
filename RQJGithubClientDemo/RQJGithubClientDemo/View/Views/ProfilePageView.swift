//
//  ProfilePageView.swift
//  RQJGithubClientDemo
//
//  Created by 任泡泡🫧 on 2024/12/19.
//

import SwiftUI

struct ProfilePageView: View {
    var body: some View {
        ErrorPage(errorMessage: AppString.authError.localizedText) {
            
        } onCancel: {
            
        }

    }
}

#Preview {
    ProfilePageView()
}
