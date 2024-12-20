//
//  LoginAuthStatus.swift
//  RQJGithubClientDemo
//
//  Created by 任泡泡🫧 on 2024/12/19.
//

import Foundation

enum LoginAuthStatus {
    case unKnown
    case isAuthenticating
    case isAuthenticated
    case isLogging
    case isLoggedin(User)
    case error(String)

    var isLoggedin: Bool {
        if case.isLoggedin = self {
            return true
        }
        return false
    }
}
