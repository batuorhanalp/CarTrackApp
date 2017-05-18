//
//  CarTrackAppUITests.swift
//  CarTrackAppUITests
//
//  Created by Batu Orhanalp on 16/05/2017.
//  Copyright © 2017 Batu Orhanalp. All rights reserved.
//

import XCTest

class CarTableViewControllerUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        app.launch()
    }
    
    func testScroll() {
        
        let table = app.tables.element
        
        table.swipeUp()
        table.swipeDown()
        
        let firstCell = table.cells.containing(.cell, identifier: "CarReuseIdentifier").element
        
        XCTAssertNotNil(firstCell)
    }
    
    func testSelect() {
        
        let app = XCUIApplication()
        app.tables.cells.containing(.staticText, identifier:"Vanessa MINI").staticTexts["Diesel"].tap()
        app.buttons["< Back"].tap()
        
        XCTAssertEqual(app.tables.count, 1)
    }
    
}
