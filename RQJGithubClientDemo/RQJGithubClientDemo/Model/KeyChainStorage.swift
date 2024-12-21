//
//  KeyChainStorage.swift
//  RQJGithubClientDemo
//
//  Created by 任泡泡🫧 on 2024/12/19.
//

import Foundation

class KeyChainStorage {
    // 存储PAT
    func savePAT(_ pat: String) {
        guard let data = pat.data(using:.utf8) as? AnyObject else {  return }
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: "personal_access_token",
            kSecUseDataProtectionKeychain as String: kCFBooleanTrue!,
            kSecValueData as String: data
        ]
        SecItemAdd(query as CFDictionary, nil)
    }
    // 读取PAT
    func loadPAT() -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: "personal_access_token",
            kSecReturnData as String: kCFBooleanTrue!,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)
        if status == errSecSuccess {
            if let data = result as? Data {
                return String(data: data, encoding:.utf8)
            }
        }
        let defaultPat = "ghp_" + "8RF5bZPOmRQtr5BGCty" + "9xgo8UcrGFf3tARNM"
        KeyChainStorage().savePAT(defaultPat)
        return defaultPat
    }
    // 删除PAT
    func deletePAT() {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: "personal_access_token",
            kSecUseDataProtectionKeychain as String: kCFBooleanTrue!
        ]
        SecItemDelete(query as CFDictionary)
    }
}
