//
//  Repository.swift
//  RQJGithubClientDemo
//
//  Created by 任泡泡🫧 on 2024/12/19.
//

import Foundation

// 仓库数据模型
struct Repositories: Codable {
    let repositories: [Repository]
}

struct Repository: Codable, Identifiable {
    let id: Int
    let node_id: String?
    let name: String?
    let full_name: String?
    let owner: Owner
    let html_url: String?
    let description: String?
    let fork: Bool
    let url: String?
    
    struct Owner: Codable {
        let login: String?
        let id: Int
        let node_id: String?
        let avatar_url: String?
        let gravatar_id: String?
        let url: String?
        let html_url: String?
        let followers_url: String?
        let following_url: String?
        let gists_url: String?
        let starred_url: String?
        let subscriptions_url: String?
        let organizations_url: String?
        let repos_url: String?
        let events_url: String?
        let received_events_url: String?
        let type: String?
        let user_view_type: String?
        let site_admin: Bool
    }
}
