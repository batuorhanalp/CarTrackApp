//
//  CarTableViewController.swift
//  CarTrackApp
//
//  Created by Batu Orhanalp on 17/05/2017.
//  Copyright © 2017 Batu Orhanalp. All rights reserved.
//

import Foundation
import UIKit

class CarTableViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    var selectedCar: Car?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.getCars {
            print("Cars: \(self.cars)")
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cars.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.carReuseIdentifier, for: indexPath)!
        
        let car = self.cars[indexPath.row]
        cell.fillWith(car: car)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedCar = cars[indexPath.row]
        
        self.performSegue(withIdentifier: R.segue.carTableViewController.detailSegue.identifier, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let detailViewController = segue.destination as? DetailViewController {    
            detailViewController.car = selectedCar!
        }
    }
    
}
