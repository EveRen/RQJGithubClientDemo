//
//  User.swift
//  RQJGithubClientDemo
//
//  Created by 任泡泡🫧 on 2024/12/20.
//

import Foundation

struct User: Codable {
    let login : String
    let id: Int
    let node_id : String?
    let avatar_url : String?
    let gravatar_id : String?
    let url : String?
    let html_url : String?
    let followers_url : String?
    let following_url : String?
    let gists_url : String?
    let starred_url : String?
    let subscriptions_url : String?
    let organizations_url : String?
    let repos_url : String?
    let events_url : String?
    let received_events_url : String?
    let type : String?
    let user_view_type : String?
    let site_admin: Bool
    let name : String?
    let company : String?
    let blog : String?
    let location : String?
    let email : String?
    let hireable: Bool?
    let bio : String?
    let twitter_username : String?
    let notification_email : String?
    let public_repos: Int
    let public_gists: Int
    let followers: Int
    let following: Int
    let created_at : String?
    let updated_at : String?
    let private_gists: Int
    let total_private_repos: Int
    let owned_private_repos: Int
    let disk_usage: Int
    let collaborators: Int
    let two_factor_authentication: Bool
    let plan: Plan
    
    struct Plan: Codable {
        let name : String?
        let space: Int
        let collaborators: Int
        let private_repos: Int
    }
}

struct UserToken: Codable {
    let token_type : String?
    let scope : String?
    let access_token : String?
}
