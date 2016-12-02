//
//  Weather.swift
//  MomChildren
//
//  Created by Mạnh Thường Quân on 11/21/16.
//  Copyright © 2016 buiduyhien. All rights reserved.
//

import Foundation

class Weather {
    var main: String
    
    init?(jsonData: [String: AnyObject]) {
        guard let main = jsonData["main"] as? String else { return nil }
        
        self.main = main
    }
}
