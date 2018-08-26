//
//  NetworkService.swift
//  GiststestApp
//
//  Created by Aleev Alexey on 26/08/2018.
//  Copyright © 2018 WayRay. All rights reserved.
//

import UIKit

class NetworkService {

    class func GETRequest(_ path: String, parameters: Dictionary<String, Any>?, complition: @escaping (Data?, Error?) -> Swift.Void) {
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.github.com"
        components.path = path
        
        if let innerParameters = parameters {
            var queryItems = [URLQueryItem]()
            innerParameters.keys.forEach { key in
                queryItems.append(URLQueryItem(name: key, value: "\(String(describing: innerParameters[key]))"))
            }
            components.queryItems = queryItems
        }
        
        guard let url = components.url else {
            fatalError()
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: request) {(responseData, response, responseError) in
            complition(responseData, responseError)
        }
        task.resume()
    }
}
