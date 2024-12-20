//
//  Repository.swift
//  RQJGithubClientDemo
//
//  Created by 任泡泡🫧 on 2024/12/19.
//

import Foundation

struct SearchRepositorys: Codable {
    let items: [Repository]
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
    let updated_at: String?
    
    // 增加初始化默认参数，方便Mock数据
    init(id: Int,
         node_id: String? = nil,
         name: String? = nil,
         full_name: String? = nil,
         owner: Owner = .init(id: 999),
         html_url: String? = nil,
         description: String? = nil,
         fork: Bool = false,
         url: String? = nil,
         updated_at: String? = nil) {
        self.id = id
        self.node_id = node_id
        self.name = name
        self.full_name = full_name
        self.owner = owner
        self.html_url = html_url
        self.description = description
        self.fork = fork
        self.url = url
        self.updated_at = updated_at
    }
    
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
        
        init(login: String? = nil,
             id: Int,
             node_id: String? = nil,
             avatar_url: String? = nil,
             gravatar_id: String? = nil,
             url: String? = nil,
             html_url: String? = nil,
             followers_url: String? = nil,
             following_url: String? = nil,
             gists_url: String? = nil,
             starred_url: String? = nil,
             subscriptions_url: String? = nil,
             organizations_url: String? = nil,
             repos_url: String? = nil,
             events_url: String? = nil,
             received_events_url: String? = nil,
             type: String? = nil,
             user_view_type: String? = nil,
             site_admin: Bool = false) {
            self.login = login
            self.id = id
            self.node_id = node_id
            self.avatar_url = avatar_url
            self.gravatar_id = gravatar_id
            self.url = url
            self.html_url = html_url
            self.followers_url = followers_url
            self.following_url = following_url
            self.gists_url = gists_url
            self.starred_url = starred_url
            self.subscriptions_url = subscriptions_url
            self.organizations_url = organizations_url
            self.repos_url = repos_url
            self.events_url = events_url
            self.received_events_url = received_events_url
            self.type = type
            self.user_view_type = user_view_type
            self.site_admin = site_admin
        }
    }
}
