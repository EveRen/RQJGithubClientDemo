//
//  MockLoginService.swift
//  RQJGithubClientDemoTests
//
//  Created by 任泡泡🫧 on 2024/12/21.
//

import Foundation
@testable import RQJGithubClientDemo

class MockLoginService: LoginServiceProtocol {
    var shouldThrowError: Bool = false
    
    func biometryAuthenticate() async throws -> Bool {
        if shouldThrowError {
            throw NSError(domain: "TestError", code: 1)
        }
        return true
    }
    
    func oAuthAuthenticate() async throws -> String {
        if shouldThrowError {
            throw NSError(domain: "TestError", code: 1)
        }
        return "mockCode"
    }
    
    func fetchAccessToken(with code: String) async throws -> RQJGithubClientDemo.UserToken {
        if shouldThrowError {
            throw NSError(domain: "TestError", code: 1)
        }
        return .init(token_type: "type", scope: "user", access_token: "mockToken")
    }
    
    func getProfileInfo(with token: String, isPAT: Bool) async throws -> RQJGithubClientDemo.User {
        if shouldThrowError {
            throw NSError(domain: "TestError", code: 1)
        }
        return .init(login: "mock")
    }
}
