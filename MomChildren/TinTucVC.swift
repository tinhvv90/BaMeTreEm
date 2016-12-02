//
//  TinTucTableVC.swift
//  MomChildren
//
//  Created by Mạnh Thường Quân on 11/13/16.
//  Copyright © 2016 buiduyhien. All rights reserved.
//

import UIKit

class TinTucVC: UIViewController {

    // MARK: Properties
    var arrayNews = [News]()
    @IBOutlet weak var tableViewNews: UITableView!
    @IBOutlet weak var activityLoadImage: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        ServiceJSON().getData(page: 1, size: "10", complete: handleDataOfService)
        activityLoadImage.startAnimating()

    }

    // MARK: Method
    func setupNavigation() {
        navigationItem.title = "Tin tuc mới nhất"
        navigationItem.backBarButtonItem?.setBackgroundImage(UIImage(named: "BackNavigation"), for: UIControlState.normal, barMetrics: UIBarMetrics.default)
    }
    
    func handleDataOfService(dict: [[String: AnyObject]]) {
        for item in dict {
            arrayNews.append(News(jsonData: item)!)
        }
        activityLoadImage.stopAnimating()
        activityLoadImage.isHidden = true
        tableViewNews.reloadData()
    }

    
    // Pass Data To DetailNewVC
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let detailVC = segue.destination as! DetailNewsVC
            if let indexPath = tableViewNews.indexPathForSelectedRow {
                detailVC.urlHTML = arrayNews[indexPath.row].content
                detailVC.titleOfNavigation = arrayNews[indexPath.row].title
            }
        }
    }
}

extension TinTucVC: UITableViewDataSource {
    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayNews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewNews.dequeueReusableCell(withIdentifier: "CellTinTuc", for: indexPath) as! CellNews
        
        // Configure Cell
        cell.title.text = arrayNews[indexPath.row].title
        cell.descriptionNews.text = arrayNews[indexPath.row].description
        cell.photoImg.downloadImageFrom(link: arrayNews[indexPath.row].imageUrls, contentMode: .scaleAspectFit, placeholder: "Placeholder")
        cell.date.text = arrayNews[indexPath.row].createdDate
        
        return cell
        
    }
    
}

extension TinTucVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

// MARK: Extension
extension UIImageView {
    func downloadImageFrom(link:String, contentMode: UIViewContentMode, placeholder: String) {
        URLSession.shared.dataTask( with: NSURL(string:link)! as URL, completionHandler: {
            (data, response, error) -> Void in
            DispatchQueue.main.async {
                self.contentMode =  contentMode
                if let data = data { self.image = UIImage(data: data) } else { self.image = UIImage(named: placeholder) }
                
            }
        }).resume()
    }
}
