//
//  Temperature.swift
//  MomChildren
//
//  Created by Mạnh Thường Quân on 11/21/16.
//  Copyright © 2016 buiduyhien. All rights reserved.
//

import Foundation

class Temperature {
    var min: Int
    var max: Int
    
    init?(jsonData: [String: AnyObject]) {
        guard let min = jsonData["min"] as? Int else { return nil }
        guard let max = jsonData["max"] as? Int else { return nil }
        
        self.min = min - 273
        self.max = max - 273
    }
}
