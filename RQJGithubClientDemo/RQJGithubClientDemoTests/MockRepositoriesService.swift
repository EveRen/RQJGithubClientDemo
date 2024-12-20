//
//  MockRepositoriesService.swift
//  RQJGithubClientDemoTests
//
//  Created by 任泡泡🫧 on 2024/12/20.
//

import Foundation
@testable import RQJGithubClientDemo

class MockRepositoriesService: RepositoriesServiceProtocol {
    var shouldThrowError: Bool = false
    var mockRepos: [Repository] = [.init(id: 999)]

    func fetchRepositories() async throws -> [RQJGithubClientDemo.Repository] {
        if shouldThrowError {
            throw NSError(domain: "TestError", code: 1)
        }
        return mockRepos
    }
    
    func searchRepository(_ key: String) async throws -> [RQJGithubClientDemo.Repository] {
        if shouldThrowError {
            throw NSError(domain: "TestError", code: 1)
        }
        return mockRepos
    }
}
