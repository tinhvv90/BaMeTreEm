//
//  ServiceJSONWeather.swift
//  MomChildren
//
//  Created by Mạnh Thường Quân on 11/21/16.
//  Copyright © 2016 buiduyhien. All rights reserved.
//

import Foundation
import Alamofire

class ServiceJSONWeather {
    func getData(complete:@escaping (_ dict: [String: AnyObject]) -> ()) {
        let APPID = "c80a2e47667cedab4873abb8a9fff762"
        // Fix cứng toạ độ
        let lat = 21.013493
        let lon = 105.796525
        let urlString = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=\(lat)&lon=\(lon)&cnt=10&mode=json&appid=\(APPID)"
        
        Alamofire.request(urlString, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            let statusCode = response.response?.statusCode
            
            if statusCode == 200 {
                let result = response.result.value as! [String: AnyObject]
                complete(result)
            }
        }
    }
}
