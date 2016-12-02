//
//  ServiceJSON.swift
//  MomChildren
//
//  Created by Mạnh Thường Quân on 11/15/16.
//  Copyright © 2016 buiduyhien. All rights reserved.
//

import Foundation
import Alamofire

class ServiceJSON {
    func getData(page: Int, size: String, complete:@escaping (_ dict: [[String: AnyObject]]) -> ()) {
        
        let urlString = "http://cdyt.azurewebsites.net/News/GetRecentNewsMother"
        let parameter = [
            "Page": page ,
            "Size": size
        ] as [String : Any]
        
        Alamofire.request(urlString, method: .post, parameters: parameter, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            let statusCode = response.response?.statusCode
            
            if statusCode == 200 {
                let result = response.result.value as! [[String: AnyObject]]
                complete(result)
            }
        }
    }
}
