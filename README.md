# RQJGithubClientDemo
It is a iOS native test demo for GitHub client.
## Keywords
**SwiftUI，Concurrency，KeyChain， XCTest，MVVM，SF Symbol，Xcode16.1，WebView，FaceID， URL Schemes, Github API**

## Development System Environment
Xcode16.1 & Minimum deployment 15.6

## How to run
Download the codes, open **RQJGithubClientDemo.xcodeproj** and **run** directly, as there is no pods or packages from Cocoapod/SPM.

## Login with OAuth，PAT， Biometry
从2021年8月13日开始，GitHub不再支持使用密码进行第三方应用的认证。这意味着，开发者需要使用其他认证方法，如OAuth 2.0或个人访问令牌（Personal Access Tokens）。
三种登录模式均可跑通，如果需要测试生物认证登录请使用真机或打开模拟器 Features -> Face ID -> Enrolled and choose matching or no matching Face.

## Features
1. Home with Explor repositories card which can go to detail page.
2. Search with keyword.
3. Profile with real userinfo




