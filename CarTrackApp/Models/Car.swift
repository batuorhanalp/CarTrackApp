//
//  Car.swift
//  CarTrackApp
//
//  Created by Batu Orhanalp on 16/05/2017.
//  Copyright © 2017 Batu Orhanalp. All rights reserved.
//

import RealmSwift

final class Car: Object, DataSource, ResponseObjectSerializable, ResponseCollectionSerializable {
    dynamic var id: String = ""
    dynamic var modelIdentifier: String = ""
    dynamic var modelName: String = ""
    dynamic var name: String = ""
    dynamic var make: String = ""
    dynamic var group: String = ""
    dynamic var color: String = ""
    dynamic var series: String = ""
    dynamic var fuelTypeRaw: String = ""
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
    dynamic var fuelLevel: Double = 0
    dynamic var transmissionRaw: String = ""
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
    dynamic var licensePlate: String = ""
    dynamic var latitude: Double = 0
    dynamic var longitude: Double = 0
    dynamic var innerCleanlinessRaw: String = ""
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
    dynamic var carImageUrl: String = ""
    
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
        self.carImageUrl = "https://prod.drive-now-content.com/fileadmin/user_upload_global/assets/cars/\(self.modelIdentifier)/\(self.color)/2x/car.png"
    }
    
    static func get() -> Results<Car> {
        let realm = try! Realm()
        return realm.objects(Car.self)
    }
    
    static func get(id: Any) -> Car? {
        let realm = try! Realm()
        return realm.objects(Car.self).filter("id == '\(id)'").first
    }

}
