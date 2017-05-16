//
//  CarService.swift
//  CarTrackApp
//
//  Created by Batu Orhanalp on 16/05/2017.
//  Copyright © 2017 Batu Orhanalp. All rights reserved.
//

import Foundation
import Alamofire

struct CarService {
    
    private static let rootPath = "cars.json"
    
    static func get(completion: @escaping ([Car]) -> ()) {
        
        let router = Router(method: .get, path: CarService.rootPath, parameters: nil)
        do {
            let request = try router.asURLRequest()
            _ = Alamofire.request(request)
                .responseObject(completionHandler: { (response: DataResponse<CarResponse>) in
                    
                    debugPrint("Car response: \(response)")
                    
                    if let value = response.result.value {
                        completion(value.cars)
                    } else {
                        completion([Car]())
                    }
                })
        } catch {
            print("An error occured: \(error)")
            completion([Car]())
        }
        
        
    }
}

struct CarResponse: ResponseObjectSerializable, ResponseCollectionSerializable {
    
    var cars = [Car]()
    
    init?(response: HTTPURLResponse, representation: AnyObject) {
        
        let object = representation as AnyObject
        cars = Car.collection(response: response, representation: object)
    }
}
