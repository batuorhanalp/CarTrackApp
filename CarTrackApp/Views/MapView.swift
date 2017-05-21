//
//  MapView.swift
//  CarTrackApp
//
//  Created by Batu Orhanalp on 18/05/2017.
//  Copyright © 2017 Batu Orhanalp. All rights reserved.
//

import MapKit

extension CarMapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView,
                 viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? SixtCarPin {
            let identifier = "sixtPin"
            
            var view: MKPinAnnotationView
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView {
                dequeuedView.annotation = annotation
                view = dequeuedView
            } else {
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y: 5)
                view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure) as UIView
            }
            
            return view
        }
        return nil
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        self.selectedPin = view.annotation as? SixtCarPin
        
        self.performSegue(withIdentifier: R.segue.carTableViewController.detailSegue.identifier, sender: self)
        
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if let annotation = view.annotation {
            drawRoute(toDestination: annotation)
        }
    }
    
    func drawRoute(toDestination destination: MKAnnotation) {
        
        if let currentLocation = locationManager.location {
            
            // Route direction request
            let directionRequest = MKDirectionsRequest()
            // From current location
            directionRequest.source = MKMapItem(placemark: MKPlacemark(coordinate: currentLocation.coordinate))
            // To selected car location
            directionRequest.destination = MKMapItem(placemark: MKPlacemark(coordinate: destination.coordinate))
            directionRequest.transportType = .automobile
            
            let directions = MKDirections(request: directionRequest)
            
            directions.calculate(completionHandler: { (response, error) in
                guard let response = response else {
                    if let error = error {
                        print("Error: \(error)")
                    }
                    
                    return
                }
                
                let route = response.routes[0]
                self.mapView.add((route.polyline), level: .aboveRoads)
                
                let rect = route.polyline.boundingMapRect
                self.mapView.setRegion(MKCoordinateRegionForMapRect(rect), animated: true)
            })
        }
    }
    
}
