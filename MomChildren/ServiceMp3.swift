//
//  ServiceMp3.swift
//  MomChildren
//
//  Created by Mạnh Thường Quân on 12/1/16.
//  Copyright © 2016 buiduyhien. All rights reserved.
//

import Foundation

class ServiceMp3 {
    func getDataFromZingMp3() {
        // Lay du lieu tu zingmp3
        do {
            let url = URL(string: "http://mp3.zing.vn/bang-xep-hang/bai-hat-Viet-Nam/IWZ9Z08I.html")
            let data = try Data(contentsOf: url!)
            // Dung TFHpple de parse du lieu
            let doc = TFHpple(htmlData: data)
            if let elements = doc?.search(withXPathQuery: "//h3[@class='title-item']/a") as? [TFHppleElement] {
                for item in elements {
                    DispatchQueue.global(qos: .default).async(execute: {
                        let id = self.getID(path: item["href"] as! NSString)
                        // Link API
                        if let url = URL(string:"http://api.mp3.zing.vn/api/mobile/song/getsonginfo?keycode=fafd463e2131914934b73310aa34a23f&requestdata={\"id\":\"\(id)\"}".addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!) {
                            // Commit1
                            var stringData: String?
                            do {
                                stringData = try String(contentsOf: url)
                            } catch let error as Error {
                                print(error.localizedDescription)
                            }
                        }
                    })
                }
            }
        } catch let error as Error {
            print(error.localizedDescription)
        }
    }
    
    func getID(path: NSString) -> String {
        // Lay ra Id.html, xoa di html
        let id = (path.lastPathComponent as NSString).deletingPathExtension
        return id
    }
}
