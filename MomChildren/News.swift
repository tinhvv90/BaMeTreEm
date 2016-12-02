//
//  News.swift
//  MomChildren
//
//  Created by Mạnh Thường Quân on 11/15/16.
//  Copyright © 2016 buiduyhien. All rights reserved.
//

import Foundation

class News {
    var title: String
    var imageUrls: String
    var description: String
    var content: String
    var createdDate: String
    
    init?(jsonData: [String: AnyObject]) {
        guard let title = jsonData["Title"] as? String else { return nil }
        guard let imageUrls = jsonData["ImageUrls"] as? [String] else { return nil }
        guard let description = jsonData["Description"] as? String else { return nil }
        guard let content = jsonData["Content"] as? String else { return nil }
        guard let createdDate = jsonData["CreatedDate"] as? Int else { return nil }
        
        self.title = title
        self.imageUrls = imageUrls[0]
        self.description = description
        self.content = content
        
        // Convert to Date
        let date = NSDate(timeIntervalSince1970: TimeInterval(createdDate))
        
        self.createdDate = String(describing: date)
        self.createdDate = self.createdDate.replacingOccurrences(of: "+0000", with: "", options: .literal, range: nil)
        
    }
    
}
