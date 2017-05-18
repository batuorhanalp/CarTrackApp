//
//  Car.swift
//  CarTrackApp
//
//  Created by Batu Orhanalp on 16/05/2017.
//  Copyright © 2017 Batu Orhanalp. All rights reserved.
//

import RealmSwift

final class Car: Object, DataSource, ResponseObjectSerializable, ResponseCollectionSerializable {
    var id: String = ""
    var modelIdentifier: String = ""
    var modelName: String = ""
    var name: String = ""
    var make: String = ""
    var group: String = ""
    var color: String = ""
    var series: String = ""
    var fuelTypeRaw: String = ""
    var fuelType: String {
        get {
            switch fuelTypeRaw {
            case "D":
                return "Diesel"
            case "H":
                return "Hybrid"
            case "E":
                return "Electric"
            default:
                return "Petrol"
            }
        }
    }
    var fuelLevel: Double = 0
    var transmissionRaw: String = ""
    var transmission: String {
        get {
            switch transmissionRaw {
            case "A":
                return "Automatic"
            default:
                return "Manual"
            }
        }
    }
    var licensePlate: String = ""
    var latitude: Double = 0
    var longitude: Double = 0
    var innerCleanlinessRaw: String = ""
    var innerCleanliness: String {
        get {
            switch innerCleanlinessRaw {
            case "CLEAN":
                return "Clean"
            case "VERY_CLEAN":
                return "Very clean"
            default:
                return "Regular"
            }
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
    
    static func get() -> [Car] {
        let realm = try! Realm()
        return realm.objects(Car.self).toArray(type: Car.self)
    }
    
    static func get(id: Any) -> Car? {
        let realm = try! Realm()
        return realm.objects(Car.self).filter({ $0.id == id as! String }).first
    }

}
