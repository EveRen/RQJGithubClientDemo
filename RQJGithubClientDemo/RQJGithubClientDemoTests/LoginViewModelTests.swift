//
//  LoginViewModelTests.swift
//  RQJGithubClientDemoTests
//
//  Created by 任泡泡🫧 on 2024/12/21.
//

import XCTest
@testable import RQJGithubClientDemo

final class LoginViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    func testBiometryAuthenticatesSuccess() async {
        let mockService: MockLoginService = .init()
        let viewModel: LoginViewModel = .init(loginService: mockService)
        await viewModel.biometryAuthenticate()
        XCTAssertTrue(viewModel.loginAuthStatus.isLoggedin)
    }

    func testBiometryAuthenticateFailure() async {
        let mockService: MockLoginService = .init()
        mockService.shouldThrowError = true
        let viewModel: LoginViewModel = .init(loginService: mockService)
        await viewModel.biometryAuthenticate()
        XCTAssertFalse(viewModel.loginAuthStatus.isLoggedin)
    }
    
    func testOAuthAuthenticateSuccess() async {
        let mockService: MockLoginService = .init()
        let viewModel: LoginViewModel = .init(loginService: mockService)
        await viewModel.oAuthAuthenticate()
        XCTAssertTrue(viewModel.loginAuthStatus.isLoggedin)
    }

    func testOAuthAuthenticateFailure() async {
        let mockService: MockLoginService = .init()
        mockService.shouldThrowError = true
        let viewModel: LoginViewModel = .init(loginService: mockService)
        await viewModel.oAuthAuthenticate()
        XCTAssertFalse(viewModel.loginAuthStatus.isLoggedin)
    }
    
    func testLoginWithPATSuccess() async {
        let mockService: MockLoginService = .init()
        let viewModel: LoginViewModel = .init(loginService: mockService)
        await viewModel.loginWithPAT()
        XCTAssertTrue(viewModel.loginAuthStatus.isLoggedin)
    }

    func testLoginWithPATFailure() async {
        let mockService: MockLoginService = .init()
        mockService.shouldThrowError = true
        let viewModel: LoginViewModel = .init(loginService: mockService)
        await viewModel.loginWithPAT()
        XCTAssertFalse(viewModel.loginAuthStatus.isLoggedin)
    }
}
