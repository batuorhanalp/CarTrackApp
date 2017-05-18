//
//  CarTableViewCell.swift
//  CarTrackApp
//
//  Created by Batu Orhanalp on 17/05/2017.
//  Copyright © 2017 Batu Orhanalp. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class CarTableViewCell: UITableViewCell {
    
    var car: Car!
    
    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var fuelTypeLabel: UILabel!
    @IBOutlet weak var transmissionLabel: UILabel!
 
    
    func fillWith(car: Car) {
        
        self.car = car
        
        self.modelLabel.text = "\(car.name) \(car.modelName)"
        self.fuelTypeLabel.text = "\(car.fuelType)"
        self.transmissionLabel.text = "\(car.transmission)"
        self.thumbImageView.sd_setImage(with: URL(string: "https://prod.drive-now-content.com/fileadmin/user_upload_global/assets/cars/\(car.modelIdentifier)/\(car.color)/2x/car.png"), placeholderImage: UIImage(named: R.image.carDefault.name))

    }
}
