
//  PrepareForChildViewController.swift
//  MomChildren
//
//  Created by Mạnh Thường Quân on 11/14/16.
//  Copyright © 2016 buiduyhien. All rights reserved.
//

import UIKit

class PrepareForChildViewController: UIViewController {
    
    var stuffs: [Stuff] = []
    
    @IBOutlet weak var tableViewPrepare: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Thêm đồ"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getData()
        tableViewPrepare.reloadData()
    }
    
    func getData() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            stuffs = try context.fetch(Stuff.fetchRequest())
        } catch let error as Error {
            print(error.localizedDescription)
        }
    }
}

extension PrepareForChildViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stuffs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewPrepare.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let stuff = stuffs[indexPath.row]
        cell.textLabel?.text = stuff.name
        
        return cell
    }
}

extension PrepareForChildViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let stuff = stuffs[indexPath.row]
            context.delete(stuff)
            
            // Save data to core data
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            do {
                stuffs = try context.fetch(Stuff.fetchRequest())
            } catch let error as Error {
                print(error.localizedDescription)
            }
        }
        
        tableViewPrepare.reloadData()
    }
}


