//
//  Router.swift
//  CarTrackApp
//
//  Created by Batu Orhanalp on 16/05/2017.
//  Copyright © 2017 Batu Orhanalp. All rights reserved.
//

import Alamofire
import Reachability

struct Router: URLRequestConvertible {
    
    // Base URL to get data
    private static let url = "http://www.codetalk.de/"
    
    // API path to get data
    var path: String!
    // API parameters [ String : Any ]
    var parameters: Parameters?
    // API method (Post, Put, Get, Delete)
    var method: Alamofire.HTTPMethod!
    
    /*
     * Checks internet connection. If the server is reachable.
     */
    static var checkConnection: NetworkStatus {
        if let reachable = Reachability.init(hostName: Router.url) {
            return reachable.currentReachabilityStatus()
        }
        
        return .NotReachable
    }
    
    init(method: Alamofire.HTTPMethod, path: String, parameters: Parameters?) {
        self.method = method
        self.parameters = parameters
        self.path = path
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = URL(string: Router.url)!
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        if self.method == Alamofire.HTTPMethod.post {
            return try Alamofire.JSONEncoding.default.encode(urlRequest, with: self.parameters)
        } else if self.method == Alamofire.HTTPMethod.put {
            return try Alamofire.JSONEncoding.default.encode(urlRequest, with: self.parameters)
        } else {
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: self.parameters)
        }
    }
}

