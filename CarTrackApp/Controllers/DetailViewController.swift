//
//  DetailViewController.swift
//  CarTrackApp
//
//  Created by Batu Orhanalp on 17/05/2017.
//  Copyright © 2017 Batu Orhanalp. All rights reserved.
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {
    
    @IBOutlet weak var carImageView: UIImageView!
    @IBOutlet weak var carDetailView: CarDetailView!
    var car: Car!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        carImageView.sd_setImage(with: URL(string: car.carImageUrl), placeholderImage: UIImage(named: R.image.carDefault.name))
        carDetailView.fillWith(car: car)
    }
    
    @IBAction func onBack(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
