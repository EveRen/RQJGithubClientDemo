//
//  DataStatus.swift
//  RQJGithubClientDemo
//
//  Created by 任泡泡🫧 on 2024/12/19.
//

import Foundation

enum DataStatus<T: Codable> {
    case unKnown
    case isLoading
    case success(T) // 成功时，携带符合Codable协议的返回数据
    case error(String) // 失败时，携带具体的错误信息
    case noData

    var isSuccess: Bool {
        if case.success = self {
            return true
        }
        return false
    }
}
