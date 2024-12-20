//
//  KeyChainStorage.swift
//  RQJGithubClientDemo
//
//  Created by 任泡泡🫧 on 2024/12/19.
//

import Foundation

class KeyChainStorage {
    // 存储用户名和密码
    func savePassword(_ password: String, for username: String) {
        guard let data = password.data(using:.utf8) as? AnyObject else {  return }
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: "password_manager",
            kSecAttrAccount as String: username,
            kSecUseDataProtectionKeychain as String: kCFBooleanTrue!,
            kSecValueData as String: data
        ]
        SecItemAdd(query as CFDictionary, nil)
    }
    // 读取用户名对应的密码
    func loadPassword(for username: String) -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: "password_manager",
            kSecAttrAccount as String: username,
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
        return nil
    }
    // 删除用户名对应的密码
    func deletePassword(for username: String) {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: "password_manager",
            kSecAttrAccount as String: username,
            kSecUseDataProtectionKeychain as String: kCFBooleanTrue!
        ]
        SecItemDelete(query as CFDictionary)
    }
}
