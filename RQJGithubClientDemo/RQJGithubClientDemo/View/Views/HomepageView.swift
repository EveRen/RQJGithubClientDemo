//
//  HomepageView.swift
//  RQJGithubClientDemo
//
//  Created by 任泡泡🫧 on 2024/12/19.
//

import SwiftUI

struct HomepageView: View {
    @State private var showLogin = false
    @State private var showProfile = false
    @State private var isloggedin = false
    
    var body: some View {
        NavigationView {
            contentView
                .navigationTitle(AppString.home.localizedText)
                .navigationBarItems(leading: profileItem, trailing: authItem)
        }
        .sheet(isPresented: $showLogin) { LoginView() }
        .sheet(isPresented: $showProfile) { ProfilePageView() }

    }
    
    var contentView: some View {
//        ScrollView {
//            VStack{
//                RepositoryListView().frame(height: 500)
//            }
//        }
        RepositoryListView()
    }
    
    var profileItem: some View {
        Button {
            showProfile.toggle()
        } label: {
            Image(systemName: "person.circle")
                .font(.title)
        }
    }
    
    var authItem: some View {
        RoundButton(buttonText: isloggedin ? AppString.login.localizedText : AppString.login.localizedText,
                    padding: 8) {
            showLogin.toggle()
        }
    }
}

#Preview {
    HomepageView()
}
