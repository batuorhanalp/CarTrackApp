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
    
    var selectedPin: SixtCarPin?
    var locationManager = LocationManager.sharedInstance
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.getCars {
            self.generatePins()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        startMap(location: locationManager.location)
    }
    
    func startMap(location: CLLocation?) {
        
        var currentLocation = location
        
        if currentLocation == nil {
            currentLocation = CLLocation(latitude: 48.134557, longitude: 11.576921)
        }
        
        let regionRadius: CLLocationDistance = 100
        
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(currentLocation!.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
        
    }
    
    // Generate pins for Sixt cars
    func generatePins() {
    
        var sixtPins = [SixtCarPin]()
        
        for car in self.cars {
            sixtPins.append(SixtCarPin(car: car))
        }
        
        mapView.addAnnotations(sixtPins)
    }
    
    // MARK - segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailViewController = segue.destination as? DetailViewController {
            detailViewController.car = self.selectedPin?.car
        }
    }
}
