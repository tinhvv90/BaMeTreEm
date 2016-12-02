//
//  MusicVC.swift
//  MomChildren
//
//  Created by Mạnh Thường Quân on 11/11/16.
//  Copyright © 2016 buiduyhien. All rights reserved.
//

import UIKit

class MusicVC: UIViewController {

    @IBOutlet weak var tableViewMusic: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Nghe nhạc"
        ServiceMp3().getDataFromZingMp3()
    }
   
}

extension MusicVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewMusic.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        return cell
    }
}
