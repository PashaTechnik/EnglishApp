//
//  EnglishAppUITests.swift
//  EnglishAppUITests
//
//  Created by Pasha on 31.05.2021.
//  Copyright © 2021 Pasha. All rights reserved.
//

import XCTest

class EnglishAppUITests: XCTestCase {


    func testDictionary() throws {
        
        let app = XCUIApplication()
        app.launch()
        app.tabBars.buttons["Словарь"].tap()
        app.navigationBars["Dictionary"].buttons["Add"].tap()
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 0).children(matching: .textField).element.tap()
        
        let app2 = app
        app2.buttons["Next keyboard"].tap()
        app2.keys["к"].tap()
        app2.keys["о"].tap()
        
        let key = app2.keys["т"]
        key.tap()
        key.tap()
        app.buttons["Перевести"].tap()
        app.navigationBars["EnglishApp.TranslateView"].buttons["Save"].tap()

    }
}

