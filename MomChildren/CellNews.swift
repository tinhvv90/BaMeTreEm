//
//  CellNews.swift
//  MomChildren
//
//  Created by Mạnh Thường Quân on 11/15/16.
//  Copyright © 2016 buiduyhien. All rights reserved.
//

import UIKit

class CellNews: UITableViewCell {

    @IBOutlet weak var photoImg: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var descriptionNews: UILabel!
    @IBOutlet weak var date: UILabel!
    
    override func prepareForReuse() {
        photoImg.image = nil
        title.text = ""
        descriptionNews.text = ""
        
    }
    
    
}
