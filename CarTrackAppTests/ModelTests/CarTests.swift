//
//  CarTests.swift
//  CarTrackApp
//
//  Created by Batu Orhanalp on 16/05/2017.
//  Copyright © 2017 Batu Orhanalp. All rights reserved.
//

import XCTest
@testable import CarTrackApp

class CarTests: XCTestCase {
    
    let carObject = ["id":"WMWSW310X0T114073",
                     "modelIdentifier": "mini",
                     "modelName": "MINI",
                     "name": "Siegfried",
                     "make": "BMW",
                     "group": "MINI",
                     "color": "midnight_black",
                     "series": "MINI",
                     "fuelType": "D",
                     "fuelLevel": 0.85,
                     "transmission": "M",
                     "licensePlate": "M-IL2647",
                     "latitude": 48.137342,
                     "longitude": 11.546826,
                     "innerCleanliness": "REGULAR",
                     "carImageUrl": "https://de.drive-now.com/static/drivenow/img/cars/mini.png"] as [String : AnyObject]
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInitWithResponse() {
        let car = Car.init(response: HTTPURLResponse(), representation: carObject as AnyObject)
        XCTAssert(car.id == "WMWSW310X0T114073")
    }
 
    func testGetAll() {
        let expectation = self.expectation(description: "Saved cars")
        
        CarService.get { (_) in
            XCTAssertTrue(Car.get().count > 0, "Cars are not saved")
            expectation.fulfill()
        }
        
        self.waitForExpectations(timeout: 5, handler:nil)
    }
    
    func testGet() {
        _ = Car.init(response: HTTPURLResponse(), representation: carObject as AnyObject).save(type: Car.self)
        let car = Car.get(id: "WMWSW310X0T114073")
        
        XCTAssertNotNil(car)
    }
}

