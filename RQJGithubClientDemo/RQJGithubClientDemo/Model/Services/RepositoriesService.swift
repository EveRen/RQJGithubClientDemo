//
//  RepositoriesService.swift
//  RQJGithubClientDemo
//
//  Created by 任泡泡🫧 on 2024/12/19.
//

import Foundation

protocol RepositoriesServiceProtocol {
    // 获取首页Explore Repositories 列表
    func fetchRepositories() async throws -> [Repository]
    // 搜索 Repositories 列表
    func searchRepository(_ key: String) async throws -> [Repository]
}

class RepositoriesService: RepositoriesServiceProtocol {
    func fetchRepositories() async throws -> [Repository] {
        guard let url = URL(string: "https://api.github.com/repositories?since=1&visibility=all") else {
            throw URLError(.badURL)
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([Repository].self, from: data)
    }
    
    func searchRepository(_ key: String) async throws -> [Repository] {
        guard let url = URL(string: "https://api.github.com/search/repositories?q=\(key)&order=stars") else {
            throw URLError(.badURL)
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let decodedRepositories = try JSONDecoder().decode(SearchRepositorys.self, from: data)
        return decodedRepositories.items
    }
}
