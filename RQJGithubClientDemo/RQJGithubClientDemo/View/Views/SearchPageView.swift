//
//  SearchPageView.swift
//  RQJGithubClientDemo
//
//  Created by 任泡泡🫧 on 2024/12/19.
//

import SwiftUI

struct SearchPageView: View {
    @StateObject private var viewModel = SearchViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $viewModel.searchText ) {
                    Task {
                        await viewModel.fetchRepositories()
                    }
                }
                resultView
                Spacer()
            }
        }
    }
    
    @ViewBuilder
    var resultView: some View {
        switch viewModel.status {
        case .unKnown:
            EmptyView()
            
        case .isLoading:
            ProgressView()
            
        case .success(let models):
            listView(models)
            
        case .error(let string):
            ErrorPage(errorMessage: string) {
                Task {
                    await viewModel.fetchRepositories()
                }
            } onCancel: {
                viewModel.setToCancel()
            }
            
        case .noData:
            NoDataView()
        }
    }
    
    func listView(_ models: [Repository]) -> some View {
        List(models) { repository in
            NavigationLink {
                WebView(url: URL(string: repository.html_url ?? "")!)
            } label: {
                RepositoryRow(repository: repository)
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    SearchPageView()
}
