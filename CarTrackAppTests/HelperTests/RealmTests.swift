//
//  RealmTests.swift
//  CarTrackApp
//
//  Created by Batu Orhanalp on 18/05/2017.
//  Copyright © 2017 Batu Orhanalp. All rights reserved.
//

import XCTest
@testable import CarTrackApp

class RealmTests: XCTestCase {
    
    let carObject = Car.init(response: HTTPURLResponse(), representation: ["id":"WMWSW310X0T114073",
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
                                                                           "carImageUrl": "https://de.drive-now.com/static/drivenow/img/cars/mini.png"] as AnyObject)
    
    func testSave() {
        let carId = carObject.save(type: Car.self)
        
        XCTAssertNotNil(carId)
    }
    
    func testSaveMainThread() {
        let car = carObject.saveOnMainThread(type: Car.self)
        
        XCTAssertNotNil(car)
        XCTAssertTrue(car?.id == "WMWSW310X0T114073")
    }
    
    func testToArray() {
        let cars = Car.get()
        let carArray = cars.toArray(type: Car.self)
        
        XCTAssertTrue(cars.count == carArray.count)
    }
    
    func testClearDatabase() {
        
        let expectation = self.expectation(description: "Realm database clear")
        
        DatabaseMethods.clearDatabase {
            let cars = Car.get()
            XCTAssertTrue(cars.count == 0)
            expectation.fulfill()
        }
        
        self.waitForExpectations(timeout: 5, handler:nil)
    }
}

