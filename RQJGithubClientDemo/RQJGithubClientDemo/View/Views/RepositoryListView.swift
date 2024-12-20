//
//  RepositoryListView.swift
//  RQJGithubClientDemo
//
//  Created by 任泡泡🫧 on 2024/12/19.
//

import SwiftUI

struct RepositoryListView: View {
    @StateObject private var viewModel = RepositoryListViewModel()
    
    var body: some View {
        contentView
            .addBoarder()
            .task {
                await viewModel.fetchRepositories()
            }
    }
    
    @ViewBuilder
    var contentView: some View {
        switch viewModel.status {
        case .unKnown:
            EmptyView()
            
        case .isLoading:
            ProgressView()
            
        case .success(let models):
            cardView(models)
            
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
    
    func cardView(_ models: [Repository]) -> some View {
        VStack {
            NavigationLink {
                listView(models)
            } label: {
                HeaderView(title: AppString.exploreRepositories.localizedText)
            }

            listView(models)
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

struct RepositoryRow: View {
    let repository: Repository

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                URLImageView(urlString: repository.owner.avatar_url ?? "")
                    .frame(width: 66, height: 66)
                    .clipShape(Circle())
                Text(repository.full_name ?? "")
                    .font(.headline)
            }
            Text(repository.description ?? "")
                .font(.subheadline)
                .foregroundColor(.gray)
            Text(repository.description ?? "")
                .font(.caption)
        }
    }
}
