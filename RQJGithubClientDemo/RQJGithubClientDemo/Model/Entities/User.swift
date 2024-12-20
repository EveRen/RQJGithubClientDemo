//
//  User.swift
//  RQJGithubClientDemo
//
//  Created by 任泡泡🫧 on 2024/12/20.
//

import Foundation

struct User: Codable {
    let login: String
//    let id: Int
//    let nodeID: String
//    let avatarURL: String?
//    let gravatarID: String?
//    let url: String?
//    let htmlURL: String?
//    let followersURL: String?
//    let followingURL: String?
//    let gistsURL: String?
//    let starredURL: String?
//    let subscriptionsURL: String?
//    let organizationsURL: String?
//    let reposURL: String?
//    let eventsURL: String?
//    let receivedEventsURL: String?
//    let type: String
//    let userViewType: String
//    let siteAdmin: Bool
//    let name: String?
//    let company: String?
//    let blog: String?
//    let location: String?
//    let email: String?
//    let hireable: Bool?
//    let bio: String?
//    let twitterUsername: String?
//    let notificationEmail: String?
//    let publicRepos: Int
//    let publicGists: Int
//    let followers: Int
//    let following: Int
//    let createdAt: Date
//    let updatedAt: Date
//    let privateGists: Int
//    let totalPrivateRepos: Int
//    let ownedPrivateRepos: Int
//    let diskUsage: Int
//    let collaborators: Int
//    let twoFactorAuthentication: Bool
//    let plan: Plan
}

struct Plan: Codable {
    let name: String
    let space: Int
    let collaborators: Int
    let privateRepos: Int
}

