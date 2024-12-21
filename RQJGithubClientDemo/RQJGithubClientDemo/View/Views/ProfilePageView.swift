//
//  ProfilePageView.swift
//  RQJGithubClientDemo
//
//  Created by 任泡泡🫧 on 2024/12/19.
//

import SwiftUI

struct ProfilePageView: View {
    @ObservedObject var viewModel: LoginViewModel
    @State private var selectedImage: UIImage?
    @State private var showImagePicker: Bool = false
    let userInfo: User

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    header
                    dataView
                    infoView
                    logoutItem
                }
            }
        }
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(selectedImage: $selectedImage)
        }
    }
    
    var header: some View {
        // Header
        HStack {
            if let image = selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 66, height: 66)
                    .clipShape(Circle())
            } else {
                URLImageView(urlString: userInfo.avatar_url ?? "")
                    .frame(width: 66, height: 66)
                    .clipShape(Circle())
            }
            VStack (alignment: .leading) {
                Text(userInfo.login)
                    .font(.headline)
                Text(AppString.create.rawValue + (userInfo.created_at?.prefix(10) ?? ""))
                    .font(.subheadline)
            }
            Spacer()
            RoundButton(buttonText: AppString.edit.localizedText) {
                showImagePicker.toggle()
            }
        }
        .padding()
    }
    
    var dataView: some View {
        HStack(spacing: 40) {
            VText(title: AppString.follwed.localizedText, value: String(userInfo.followers))
            VText(title: AppString.follwing.localizedText, value: String(userInfo.following))
            VText(title: AppString.repoCount.localizedText, value: String(userInfo.public_repos))
        }
    }
    
    var infoView: some View {
        VStack {
            HText(title: AppString.company.localizedText, value: userInfo.company ?? AppString.noValue.localizedText)
            Divider()
            HText(title: AppString.location.localizedText, value: userInfo.location ?? AppString.noValue.localizedText)
            Divider()
            HText(title: AppString.blog.localizedText, value: userInfo.blog ?? AppString.noValue.localizedText)
            Divider()
            HText(title: AppString.email.localizedText, value: userInfo.email ?? AppString.noValue.localizedText)
            Divider()
        }
    }
    
    var logoutItem: some View {
        RoundButton(buttonText: AppString.logout.localizedText) {
            viewModel.setToCancel()
        }
        .padding(.vertical, 50)
    }
}

struct VText: View {
    let title: String
    let value: String
    var body: some View {
        VStack(spacing: 15) {
            Text(value)
            Text(title)
        }
    }
}

struct HText: View {
    let title: String
    let value: String
    var body: some View {
        HStack(spacing: 15) {
            Text(title)
                .font(.headline)
            Spacer()
            Text(value)
                .font(.body)
        }
        .padding()
    }
}
