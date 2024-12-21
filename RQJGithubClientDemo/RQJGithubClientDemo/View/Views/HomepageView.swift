//
//  HomepageView.swift
//  RQJGithubClientDemo
//
//  Created by 任泡泡🫧 on 2024/12/19.
//

import SwiftUI
import Combine

struct HomepageView: View {
    @StateObject private var viewModel = LoginViewModel()
    @State private var showProfile = false
    @State private var showSearch = false
    
    var body: some View {
        NavigationView {
            contentView
                .navigationTitle(AppString.home.localizedText)
                .navigationBarItems(leading: profileItem,
                                    trailing: searchItem)
        }
        .sheet(isPresented: $showSearch) { SearchPageView() }
        .sheet(isPresented: $showProfile) {
            switch viewModel.loginAuthStatus {
            case .isLoggedin(let user):
                ProfilePageView(viewModel: viewModel, userInfo: user)
                
            default:
                LoginView(viewModel: viewModel)
            }
        }
    }
    
        var contentView: some View {
            ScrollView {
                RepositoryListView().frame(height: 450)
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
}

#Preview {
    HomepageView()
}
