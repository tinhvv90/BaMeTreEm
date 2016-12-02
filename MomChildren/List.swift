//
//  List.swift
//  MomChildren
//
//  Created by Mạnh Thường Quân on 11/21/16.
//  Copyright © 2016 buiduyhien. All rights reserved.
//

import Foundation

class List {
    var dt: Int
    var temp: Temperature
    var weather: Weather
    
    init?(jsonData: [String: AnyObject]) {
        guard let dt = jsonData["dt"] as? Int else { return nil }
        self.dt = dt
        
        guard let temp = jsonData["temp"] as? [String: AnyObject] else { return nil }
        self.temp = Temperature(jsonData: temp)!
        
        guard let weather = jsonData["weather"] as? [[String: AnyObject]] else { return nil }
        self.weather = Weather(jsonData: weather[0])!
    }
}
