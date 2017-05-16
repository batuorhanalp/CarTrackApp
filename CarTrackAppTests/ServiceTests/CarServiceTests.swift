//
//  CarServiceTests.swift
//  CarTrackApp
//
//  Created by Batu Orhanalp on 16/05/2017.
//  Copyright © 2017 Batu Orhanalp. All rights reserved.
//

import XCTest
@testable import CarTrackApp

class CarServiceTests: XCTestCase {
    
    func testGetCars() {
        
        let expectation = self.expectation(description: "Car service request ")
        
        CarService.get { (cars) in
            XCTAssertTrue(cars.count > 0, "Cars service is not working")
            expectation.fulfill()
        }
        
        self.waitForExpectations(timeout: 5, handler:nil)
    }
}
