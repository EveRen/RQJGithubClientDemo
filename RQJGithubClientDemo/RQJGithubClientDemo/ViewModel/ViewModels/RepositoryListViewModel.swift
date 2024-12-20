//
//  RepositoryListViewModel.swift
//  RQJGithubClientDemo
//
//  Created by 任泡泡🫧 on 2024/12/19.
//

import Foundation

class RepositoryListViewModel: ObservableObject {
    private let repositoriesService: RepositoriesServiceProtocol
    @Published var status: DataStatus<[Repository]> = .unKnown

    init(repositoriesService: RepositoriesServiceProtocol = RepositoriesService()) {
        self.repositoriesService = repositoriesService
    }
    
    @MainActor
    func fetchRepositories() async {
        status = .isLoading
        do {
            let repos = try await repositoriesService.fetchRepositories()
            status = .success(repos)
        } catch {
            status = .error(error.localizedDescription)
        }
    }
    
    @MainActor
    func setToCancel() {
        status = .unKnown
    }
}
