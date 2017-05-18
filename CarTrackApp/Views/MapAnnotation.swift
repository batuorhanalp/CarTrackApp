//
//  MapAnnotation.swift
//  CarTrackApp
//
//  Created by Batu Orhanalp on 18/05/2017.
//  Copyright © 2017 Batu Orhanalp. All rights reserved.
//

import MapKit
import Contacts

class SixtCarPin: NSObject, MKAnnotation {
    
    let car: Car!
    let title: String?
    let subtitle: String?
    let coordinate: CLLocationCoordinate2D
    
    init(car: Car) {
        
        self.title = "\(car.name) \(car.modelName)"
        self.subtitle = "\(car.transmission) / \(car.fuelType)"
        self.car = car
        self.coordinate = CLLocationCoordinate2D(latitude: car.latitude, longitude: car.longitude)
        
        super.init()
    }
    
    // Annotation call when touched on point
    
    func mapItem() -> MKMapItem {
        
        let infoDictionary = [CNPostalAddressStreetKey: subtitle!]
        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: infoDictionary)
        
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = title
        
        return mapItem
    }
}
