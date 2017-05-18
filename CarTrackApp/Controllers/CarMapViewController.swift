//
//  CarMapViewController.swift
//  CarTrackApp
//
//  Created by Batu Orhanalp on 17/05/2017.
//  Copyright © 2017 Batu Orhanalp. All rights reserved.
//

import Foundation
import MapKit

class CarMapViewController: BaseViewController {
    
    var locationManager = LocationManager.sharedInstance
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.getCars {
            // TODO
            
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        startMap(location: locationManager.location)
    }
    
    func startMap(location: CLLocation?) {
        
        var currentLocation = location
        
        if currentLocation == nil {
           currentLocation = CLLocation(latitude: 0, longitude: 0)
        }
        
        let regionRadius: CLLocationDistance = 100
        
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(currentLocation!.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
        
    }
}
