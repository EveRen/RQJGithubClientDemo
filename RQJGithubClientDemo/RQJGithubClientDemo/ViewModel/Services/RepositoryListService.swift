//
//  RepositoryListService.swift
//  RQJGithubClientDemo
//
//  Created by 任泡泡🫧 on 2024/12/19.
//

import Foundation

protocol RepositoryListService {
    var status: DataStatus<[Repository]> { get }
    func fetchRepositories() async
}
