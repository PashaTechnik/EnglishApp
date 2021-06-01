//
//  EnglishAppTests.swift
//  EnglishAppTests
//
//  Created by Pasha on 29.05.2021.
//  Copyright © 2021 Pasha. All rights reserved.
//

import XCTest
@testable import EnglishApp
class EnglishAppTests: XCTestCase {

    var user: User?
    override func setUpWithError() throws {
        let promise = expectation(description: "Expectation")
        let network = NetworkManager()
        network.fetchData { (user) in
            self.user = user
            promise.fulfill()
        }
        wait(for: [promise], timeout: 5)
    }


    func testPointsEditing() throws {

        let points = CurrentUser.Points
        NetworkManager.editPoints(points: 10)
        let newPoints = points! + 10
        let expectedPoints = CurrentUser.Points
        XCTAssertEqual(newPoints, expectedPoints)
    }

    func testDictionaryEditing() throws {

        var expectedDictionary = CurrentUser.Dictionary
        NetworkManager.updateDictionary(newDict: ["test":"test"])
        let newDictionary = CurrentUser.Dictionary
        expectedDictionary?.merge(dict: ["test":"test"])
        XCTAssertEqual(newDictionary, expectedDictionary)
    }

    func testGrammarQuestionsEditing() throws {

        var expectedGrammarQuestions = CurrentUser.GrammarQuestions
        NetworkManager.editGrammarQuestions(grammarQuestionIndex: 100)
        let newGrammarQuestions = CurrentUser.GrammarQuestions
        expectedGrammarQuestions?.append(100)
        XCTAssertEqual(newGrammarQuestions, expectedGrammarQuestions)
    }

    func testUserInit() throws {
        let expectedUser = User(firstName: CurrentUser.FirstName!, lastName: CurrentUser.LastName!, email: "", points: CurrentUser.Points!, dictionary: CurrentUser.Dictionary!, profileImage: CurrentUser.Image)
        XCTAssertEqual(user, expectedUser)
    }
}
