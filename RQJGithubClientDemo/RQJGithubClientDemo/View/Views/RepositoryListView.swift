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
        VStack {
            HStack {
                Text(AppString.exploreRepositories.localizedText)
                    .font(.title)
                Spacer()
            }
            .padding(.horizontal)
            List(models) { repository in
                RepositoryRow(repository: repository)
            }
            .listStyle(.plain)
        }
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

struct RepositoryListView_Previews: PreviewProvider {
    static var previews: some View {
        RepositoryListView()
    }
}
