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
    
}
