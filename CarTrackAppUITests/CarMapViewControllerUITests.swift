//
//  CarMapViewControllerUITests.swift
//  CarTrackApp
//
//  Created by Batu Orhanalp on 18/05/2017.
//  Copyright © 2017 Batu Orhanalp. All rights reserved.
//

import XCTest

class CarMapViewControllerUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        app.launch()
    }
    
    func testSelect() {
        
        app.tabBars.buttons["Map View"].tap()
        
        let predicate = NSPredicate(format: "exists == 1")
        let query = app.otherElements["Vanessa MINI, Manual / Diesel"]
        expectation(for: predicate, evaluatedWith: query, handler: nil)
        
        waitForExpectations(timeout: 5, handler: nil)
    }
}

