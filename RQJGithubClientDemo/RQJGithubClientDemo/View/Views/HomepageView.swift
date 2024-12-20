//
//  HomepageView.swift
//  RQJGithubClientDemo
//
//  Created by 任泡泡🫧 on 2024/12/19.
//

import SwiftUI
import Combine

struct HomepageView: View {
    @State private var showLogin = false
    @State private var showProfile = false
    @State private var showSearch = false
    @State private var isloggedin = false
    
    var body: some View {
        NavigationView {
            contentView
                .navigationTitle(AppString.home.localizedText)
                .navigationBarItems(leading: profileItem,
                                    trailing: HStack {
                    searchItem
                    authItem
                })
        }
        .sheet(isPresented: $showLogin) { LoginView() }
        .sheet(isPresented: $showProfile) { ProfilePageView() }
        .sheet(isPresented: $showSearch) { SearchPageView() }
    }
    
    var contentView: some View {
        ScrollView {
                RepositoryListView().frame(height: 500)
                    .padding(.horizontal)

        }
    }
    
    var profileItem: some View {
        Button {
            showProfile.toggle()
        } label: {
            Image(systemName: "person.circle")
                .font(.title)
        }
    }
    
    var searchItem: some View {
        Button {
            showSearch.toggle()
        } label: {
            Image(systemName: "magnifyingglass")
                .font(.title)
        }
    }
    
    var authItem: some View {
        RoundButton(buttonText: isloggedin ? AppString.login.localizedText : AppString.login.localizedText,
                    padding: 8) {
            showLogin.toggle()
        }
                    .accessibilityIdentifier("authItem") // 添加可访问性标识符
    }
}

#Preview {
    HomepageView()
}
