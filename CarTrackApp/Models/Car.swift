//
//  Car.swift
//  CarTrackApp
//
//  Created by Batu Orhanalp on 16/05/2017.
//  Copyright © 2017 Batu Orhanalp. All rights reserved.
//

/*
 "id": "WMWSW31010T113555",
 "modelIdentifier": "mini",
 "modelName": "MINI",
 "name": "Peggy",
 "make": "BMW",
 "group": "MINI",
 "color": "midnight_black",
 "series": "MINI",
 "fuelType": "D",
 "fuelLevel": 0.7,
 "transmission": "M",
 "licensePlate": "M-IL2642",
 "latitude": 48.130227,
 "longitude": 11.566136,
 "innerCleanliness": "VERY_CLEAN",
 "carImageUrl": "https://de.drive-now.com/static/drivenow/img/cars/mini.png"
 */

import RealmSwift

enum FuelType: String {
    case diesel = "D"
    case petrol = "P"
    case hybrid = "H"
    case electric = "E"
}

enum Transmission: String {
    case automatic = "A"
    case manual = "M"
}

enum Cleanliness: String {
    case regular = "REGULAR"
    case clean = "CLEAN"
    case veryClean = "VERY_CLEAN"
}

struct CarEntity {
    let id: String
    let modelIdentifier: String
    let modelName: String
    let name: String
    let make: String
    let group: String
    let color: String
    let series: String
    let fuelType: String
    let fuelLevel: Double
    let transmission: String
    let licensePlate: String
    let latitude: Double
    let longitude: Double
    let innerCleanliness: String
    let carImageUrl: String
}

final class Car: Object, ResponseObjectSerializable, ResponseCollectionSerializable {
    var id: String = ""
    var modelIdentifier: String = ""
    var modelName: String = ""
    var name: String = ""
    var make: String = ""
    var group: String = ""
    var color: String = ""
    var series: String = ""
    var fuelTypeRaw: String = ""
    var fuelType: FuelType {
        get {
            if let type = FuelType(rawValue: fuelTypeRaw) {
                return type
            }
            return .petrol
        } set {
            self.fuelTypeRaw = newValue.rawValue
        }
    }
    var fuelLevel: Double = 0
    var transmissionRaw: String = ""
    var transmission: Transmission {
        get {
            if let type = Transmission(rawValue: transmissionRaw) {
                return type
            }
            return .manual
        } set {
            self.transmissionRaw = newValue.rawValue
        }
    }
    var licensePlate: String = ""
    var latitude: Double = 0
    var longitude: Double = 0
    var innerCleanlinessRaw: String = ""
    var innerCleanliness: Cleanliness {
        get {
            if let type = Cleanliness(rawValue: innerCleanlinessRaw) {
                return type
            }
            return .regular
        } set {
            self.innerCleanlinessRaw = newValue.rawValue
        }
    }
    var carImageUrl: String = ""
    
    /*
     * Primary key
     */
    override static func primaryKey() -> String {
        return "id"
    }
    
    convenience required init(response: HTTPURLResponse, representation: AnyObject) {
        
        self.init()
        
        self.id = representation.value(forKeyPath: "id") as! String
        self.modelIdentifier = representation.value(forKeyPath: "modelIdentifier") as! String
        self.modelName = representation.value(forKeyPath: "modelName") as! String
        self.name = representation.value(forKeyPath: "name") as! String
        self.make = representation.value(forKeyPath: "make") as! String
        self.group = representation.value(forKeyPath: "group") as! String
        self.color = representation.value(forKeyPath: "color") as! String
        self.series = representation.value(forKeyPath: "series") as! String
        self.fuelTypeRaw = representation.value(forKeyPath: "fuelType") as! String
        self.fuelLevel = representation.value(forKeyPath: "fuelLevel") as! Double
        self.transmissionRaw = representation.value(forKeyPath: "transmission") as! String
        self.licensePlate = representation.value(forKeyPath: "licensePlate") as! String
        self.latitude = representation.value(forKeyPath: "latitude") as! Double
        self.longitude = representation.value(forKeyPath: "longitude") as! Double
        self.innerCleanlinessRaw = representation.value(forKeyPath: "innerCleanliness") as! String
        self.carImageUrl = representation.value(forKeyPath: "carImageUrl") as! String
    }
}
