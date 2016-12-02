//
//  ThongBaoVC.swift
//  MomChildren
//
//  Created by Mạnh Thường Quân on 11/17/16.
//  Copyright © 2016 buiduyhien. All rights reserved.
//

import UIKit

class ThongBaoVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var labelNgay: UILabel!
    @IBOutlet weak var temperatureMin: UILabel!
    @IBOutlet weak var temperatureMax: UILabel!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var AMPM: UILabel!
    
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var labelOfDatLichKham: UILabel!
    @IBOutlet weak var labelOfThongBaoKhac: UILabel!
    @IBOutlet weak var myactive: UIActivityIndicatorView!
    
    @IBOutlet weak var leftConstraintOfLichDatKhamView: NSLayoutConstraint!
    @IBOutlet weak var rightConstraintOfLichDatKhamView: NSLayoutConstraint!
    @IBOutlet weak var leftConstraintOfThongbaoKhacView: NSLayoutConstraint!
    @IBOutlet weak var rightConstraintOfThongBaoView: NSLayoutConstraint!
    
    // MARK: Properties
    var lists = [List]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigation()
        statusDefault()
        myactive.startAnimating()
        ServiceJSONWeather().getData(complete: handleDataOfService)
    }

    // MARK: Method
    
    func handleDataOfService(dict: [String: AnyObject]) {
        let temp = dict["list"] as! [[String: AnyObject]]
        for item in temp {
            lists.append(List(jsonData: item)!)
        }
        imgView.image = UIImage(named: lists[0].weather.main)
        temperatureMin.text = String(lists[0].temp.min) + "º"
        temperatureMax.text = String(lists[0].temp.max) + "º"
        stopAnimate()
        collectionView.reloadData()
    }
    
    func stopAnimate() {
        myactive.stopAnimating()
        myactive.isHidden = true
    }
    
    func setupNavigation() {
        navigationItem.title = "Thông báo"
    }
    
    func statusDefault() {
        leftConstraintOfThongbaoKhacView.constant = view.frame.width
        rightConstraintOfThongBaoView.constant = -view.frame.width
        self.labelOfDatLichKham.isHidden = false
        self.labelOfThongBaoKhac.isHidden = true
    }
    
    func showLichDatKham() {
        UIView.animate(withDuration: 0.6) {
            self.leftConstraintOfLichDatKhamView.constant = 0
            self.rightConstraintOfLichDatKhamView.constant = 0
            self.leftConstraintOfThongbaoKhacView.constant = self.view.frame.width
            self.rightConstraintOfThongBaoView.constant = -self.view.frame.width
            
            self.labelOfDatLichKham.isHidden = false
            self.labelOfThongBaoKhac.isHidden = true
            self.view.layoutIfNeeded()
        }
        
    }
    
    func showThongBaoKhac() {
        UIView.animate(withDuration: 0.6) {
            self.leftConstraintOfLichDatKhamView.constant = -self.view.frame.width
            self.rightConstraintOfLichDatKhamView.constant = self.view.frame.width
            self.leftConstraintOfThongbaoKhacView.constant = 0
            self.rightConstraintOfThongBaoView.constant = 0
            
            self.labelOfDatLichKham.isHidden = true
            self.labelOfThongBaoKhac.isHidden = false
            self.view.layoutIfNeeded()
        }
    }

    // MARK: Action
    
    @IBAction func actionDatLichKham(_ sender: UIButton) {
        showLichDatKham()
    }
    
    @IBAction func actionThongBaoKhac(_ sender: UIButton) {
        showThongBaoKhac()
    }
    
}

extension ThongBaoVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return lists.count-1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellWeather", for: indexPath) as! CellWeather
        
        // Configure Cell
        cell.imgView.image = UIImage(named: lists[indexPath.row+1].weather.main)
        cell.temperatureMin.text = String(lists[indexPath.row+1].temp.min) + "º"
        cell.temperatureMax.text = String(lists[indexPath.row+1].temp.max) + "º"
        
        return cell
    }
}
