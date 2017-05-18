//
//  LocationTests.swift
//  CarTrackApp
//
//  Created by Batu Orhanalp on 18/05/2017.
//  Copyright © 2017 Batu Orhanalp. All rights reserved.
//

import XCTest
@testable import CarTrackApp

class LocationTests: XCTestCase {
    
    func testLocation() {
        
        let locationManager = LocationManager.sharedInstance
        
        XCTAssertNotNil(locationManager.location)
    }
}

