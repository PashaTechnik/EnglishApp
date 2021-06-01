//
//  ProfileViewControllerTests.swift
//  EnglishAppTests
//
//  Created by Pasha on 01.06.2021.
//  Copyright © 2021 Pasha. All rights reserved.
//

import XCTest
@testable import EnglishApp
class ProfileViewControllerTests: XCTestCase {

    let profileViewController = ProfileViewController()

    func testGetLevel() throws {
        let expectedLevel = "Elementary"
        let level = profileViewController.getLevel(150).0
        XCTAssertEqual(level, expectedLevel)
    }
    func testGetLevelNum() throws {
        let expectedLevel = 3
        let level = profileViewController.getLevel(250).1
        XCTAssertEqual(level, expectedLevel)
    }
}
