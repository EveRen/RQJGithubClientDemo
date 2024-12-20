//
//  LoginService.swift
//  RQJGithubClientDemo
//
//  Created by 任泡泡🫧 on 2024/12/19.
//

import Foundation

protocol LoginService {
    func startLogin()
    func getAccessToken(fromCode code: String) async
}
