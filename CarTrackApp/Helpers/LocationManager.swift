//
//  Location.swift
//  CarTrackApp
//
//  Created by Batu Orhanalp on 17/05/2017.
//  Copyright © 2017 Batu Orhanalp. All rights reserved.
//

import MapKit

class LocationManager: NSObject, CLLocationManagerDelegate {
    
    static let sharedInstance = LocationManager()
    private var locationManager = CLLocationManager()
    
    var location: CLLocation?
    
    private override init () {
        super.init()
        if self.locationManager.responds(to: #selector(CLLocationManager.requestAlwaysAuthorization)) {
            self.locationManager.requestWhenInUseAuthorization()
        }
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.distanceFilter = 50
        self.locationManager.startUpdatingLocation()
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        self.location = manager.location
        
    }
}

