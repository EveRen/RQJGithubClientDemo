//
//  RepositoryListViewModel.swift
//  RQJGithubClientDemo
//
//  Created by 任泡泡🫧 on 2024/12/19.
//

import Foundation

class RepositoryListViewModel: ObservableObject, RepositoryListService {
    @Published var status: DataStatus<[Repository]> = .unKnown

    @MainActor
    func fetchRepositories() async {
        guard let url = URL(string: "https://api.github.com/repositories?since=1&visibility=all") else {
            status = .error(AppString.requestError.localizedText)
            return
        }
        status = .isLoading
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedRepositories = try JSONDecoder().decode([Repository].self, from: data)
            status = .success(decodedRepositories)
        } catch {
            status = .error(error.localizedDescription)
        }
    }
    
    @MainActor
    func setToCancel() {
        status = .unKnown
    }
}
