//
//  LocalizableString.swift
//  RQJGithubClientDemo
//
//  Created by 任泡泡🫧 on 2024/12/19.
//

import Foundation

enum AppString: String {
    case login
    case logout
    case loginDetail
    case loginWithBiometry
    case loginWithBiometryDetail
    case loginWithWeb
    case loginWithPAT
    case personalAccessTokens
    case authError
    case confirm
    case authSuccess
    
    case home
    case exploreRepositories
    
    case errorTitle
    case cancel
    case retry
    case requestError
    case noData
    
    case search
    
    var localizedText: String { NSLocalizedString(self.rawValue, comment: "") }
}
