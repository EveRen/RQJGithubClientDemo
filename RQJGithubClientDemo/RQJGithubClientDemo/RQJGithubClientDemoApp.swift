//
//  RQJGithubClientDemoApp.swift
//  RQJGithubClientDemo
//
//  Created by 任泡泡🫧 on 2024/12/19.
//

import SwiftUI

@main
struct RQJGithubClientDemoApp: App {
    var body: some Scene {
        WindowGroup {
            HomepageView()
                .onOpenURL { url in
                    // 处理接收到的URL
                    print("接收到URL Scheme回调：\(url.absoluteString)")
                    // 在这里可以根据URL的内容进行相应的操作，如解析参数等
                }
        }
    }
}
