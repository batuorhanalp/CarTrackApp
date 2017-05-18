//
//  CarDetailScrollView.swift
//  CarTrackApp
//
//  Created by Batu Orhanalp on 18/05/2017.
//  Copyright © 2017 Batu Orhanalp. All rights reserved.
//

import UIKit

class CarDetailView: UIView {
    
    var view: UIView!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var groupLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var fuelTypeLabel: UILabel!
    @IBOutlet weak var fuelLevelLabel: UILabel!
    @IBOutlet weak var licenseLabel: UILabel!
    @IBOutlet weak var transmissionLabel: UILabel!
    @IBOutlet weak var cleanlinessLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    func xibSetup() {
        view = loadViewFromNib()
        
        view.frame = bounds
        view.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        
        let nib = UINib(nibName: R.nib.carDetailView.name, bundle: R.nib.carDetailView.bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
    
    func fillWith(car: Car) {
        self.modelLabel.text = "\(car.name) \(car.modelName)"
        self.groupLabel.text = "\(car.group)"
        self.colorLabel.text = "\(car.color)"
        self.fuelTypeLabel.text = "\(car.fuelType)"
        self.fuelLevelLabel.text = "\(car.fuelLevel)"
        self.licenseLabel.text = "\(car.licensePlate)"
        self.transmissionLabel.text = "\(car.transmission)"
        self.cleanlinessLabel.text = "\(car.innerCleanliness)"
    }
    
}
