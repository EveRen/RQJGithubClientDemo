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
    
    init(login: String,
         id: Int = 0,
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
         site_admin: Bool = false,
         name: String? = nil,
         company: String? = nil,
         blog: String? = nil,
         location: String? = nil,
         email: String? = nil,
         hireable: Bool? = nil,
         bio: String? = nil,
         twitter_username: String? = nil,
         notification_email: String? = nil,
         public_repos: Int = 0,
         public_gists: Int = 0,
         followers: Int = 0,
         following: Int = 0,
         created_at: String? = nil,
         updated_at: String? = nil,
         private_gists: Int = 0,
         total_private_repos: Int = 0,
         owned_private_repos: Int = 0,
         disk_usage: Int = 0,
         collaborators: Int = 0,
         two_factor_authentication: Bool = false,
         plan: Plan = .init()) {
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
        self.name = name
        self.company = company
        self.blog = blog
        self.location = location
        self.email = email
        self.hireable = hireable
        self.bio = bio
        self.twitter_username = twitter_username
        self.notification_email = notification_email
        self.public_repos = public_repos
        self.public_gists = public_gists
        self.followers = followers
        self.following = following
        self.created_at = created_at
        self.updated_at = updated_at
        self.private_gists = private_gists
        self.total_private_repos = total_private_repos
        self.owned_private_repos = owned_private_repos
        self.disk_usage = disk_usage
        self.collaborators = collaborators
        self.two_factor_authentication = two_factor_authentication
        self.plan = plan
    }
    
    struct Plan: Codable {
        let name : String?
        let space: Int
        let collaborators: Int
        let private_repos: Int
        
        init(name: String? = nil,
             space: Int = 0,
             collaborators: Int = 0,
             private_repos: Int = 0) {
            self.name = name
            self.space = space
            self.collaborators = collaborators
            self.private_repos = private_repos
        }
    }
}

struct UserToken: Codable {
    let token_type : String?
    let scope : String?
    let access_token : String?
}
