//
//  BaseViewController.swift
//  CarTrackApp
//
//  Created by Batu Orhanalp on 17/05/2017.
//  Copyright © 2017 Batu Orhanalp. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    var cars = Car.get()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    
    func getCars(completion: @escaping (() -> ())){
        
        if cars.count == 0 {
            CarService.get(completion: { [unowned self] (cars) in
                self.cars = cars
                completion()
            })
        } else {
            completion()
        }
        
    }
}
