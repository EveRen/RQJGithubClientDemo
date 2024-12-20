//
//  RepositoryListViewModelTests.swift
//  RQJGithubClientDemoTests
//
//  Created by 任泡泡🫧 on 2024/12/20.
//

import XCTest
@testable import RQJGithubClientDemo

final class RepositoryListViewModelTests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchRepositoriesSuccess() async {
        let mockService: MockRepositoriesService = .init()
        let viewModel: RepositoryListViewModel = .init(repositoriesService: mockService)
        await viewModel.fetchRepositories()
        XCTAssertTrue(viewModel.status.isSuccess)
    }

    func testFetchRepositoriesFailure() async {
        let mockService: MockRepositoriesService = .init()
        mockService.shouldThrowError = true
        let viewModel: RepositoryListViewModel = .init(repositoriesService: mockService)
        await viewModel.fetchRepositories()
        XCTAssertFalse(viewModel.status.isSuccess)
    }

}
