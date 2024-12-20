//
//  HomePageViewUITests.swift
//  RQJGithubClientDemoUITests
//
//  Created by 任泡泡🫧 on 2024/12/20.
//

import XCTest

final class HomePageViewUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        app.terminate()
        app = nil
        try super.tearDownWithError()
    }

    func testHomePageButtonExists() {
        let profileButton = app.buttons["person.circle"]
        XCTAssert(profileButton.exists)
        let searchButton = app.buttons["magnifyingglass"]
        XCTAssert(searchButton.exists)
        let authButton = app.buttons["authItem"]
        XCTAssert(authButton.exists)
    }
}
