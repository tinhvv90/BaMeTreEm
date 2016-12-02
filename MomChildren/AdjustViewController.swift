//
//  AdjustViewController.swift
//  MomChildren
//
//  Created by Mạnh Thường Quân on 11/28/16.
//  Copyright © 2016 buiduyhien. All rights reserved.
//

import UIKit

class AdjustViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    
    @IBOutlet weak var bottomConstraintOfButtonTiepTuc: NSLayoutConstraint!
    
    @IBOutlet weak var buttonBaMeMangThai: UIButton!
    @IBOutlet weak var buttonBaMeMoiSinh: UIButton!
    @IBOutlet weak var buttonBaMeNuoiConNho: UIButton!
    
    @IBOutlet weak var labelOfBaMeMangThai: UILabel!
    @IBOutlet weak var labelWeekOfBaMeMangThai: UILabel!
    
    @IBOutlet weak var labelOfBaMeMoiSinh: UILabel!
    @IBOutlet weak var imgOfBaMeMoiSinh: UIImageView!
    @IBOutlet weak var labelStatusChildrenOfBaMeMoiSinh: UILabel!
    @IBOutlet weak var labelWeekOfBaMeMoiSinh: UILabel!
    
    @IBOutlet weak var labelOfBaMeNuoiConNho: UILabel!
    @IBOutlet weak var labelWeekOfBaMeNuoiConNho: UILabel!
    @IBOutlet weak var labelStatusChildrenOfBaMeNuoiConNho: UILabel!
    @IBOutlet weak var imgOfBaMeNuoiConNho: UIImageView!
    
    @IBOutlet weak var spaceBetweenButtonBaMeMangThaiAndBaMeMoiSinh: NSLayoutConstraint!
    @IBOutlet weak var spaceBetweenButtonBaMeMoiSinhAndBaMeNuoiConNho: NSLayoutConstraint!
    
    var isCheckClickButton = false
    var week: Int!
    var isStatusChildren: Bool!
    var isStatusMom: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bottomConstraintOfButtonTiepTuc.constant = 0.1 * view.frame.height
        setupNavigation()
        statusDefault()
        
    }
    
    // MARK: Methods
    
    func setupNavigation() {
        title = "Điều chỉnh"
    }
    
    func restartStatusOfButtons() {
        buttonBaMeMangThai.isSelected = false
        buttonBaMeMoiSinh.isSelected = false
        buttonBaMeNuoiConNho.isSelected = false
    }
    
    func statusDefault() {
        labelOfBaMeMangThai.isHidden = true
        labelWeekOfBaMeMangThai.isHidden = true
        
        labelOfBaMeMoiSinh.isHidden = true
        imgOfBaMeMoiSinh.isHidden = true
        labelStatusChildrenOfBaMeMoiSinh.isHidden = true
        labelWeekOfBaMeMoiSinh.isHidden = true
        
        labelOfBaMeNuoiConNho.isHidden = true
        labelWeekOfBaMeNuoiConNho.isHidden = true
        labelStatusChildrenOfBaMeNuoiConNho.isHidden = true
        imgOfBaMeNuoiConNho.isHidden = true
        
        spaceBetweenButtonBaMeMangThaiAndBaMeMoiSinh.constant = 20
        spaceBetweenButtonBaMeMoiSinhAndBaMeNuoiConNho.constant = 20
    }
    
    func displayViewControllerUsingPopOver(viewController: UIViewController, width: CGFloat, height: CGFloat) {
        viewController.popoverPresentationController?.delegate = self
        viewController.popoverPresentationController?.sourceView = self.view
        viewController.preferredContentSize = CGSize(width: width, height: height)
        viewController.popoverPresentationController?.sourceRect = CGRect(x: view.bounds.midX, y: view.bounds.midY, width: 0, height: 0)
    }
    
    // MARK: Actions
    
    @IBAction func setStatusOfButton(_ sender: UIButton) {
        switch sender {
        case buttonBaMeMangThai:
            restartStatusOfButtons()
            buttonBaMeMangThai.isSelected = true
        case buttonBaMeMoiSinh:
            restartStatusOfButtons()
            buttonBaMeMoiSinh.isSelected = true
        case buttonBaMeNuoiConNho:
            restartStatusOfButtons()
            buttonBaMeNuoiConNho.isSelected = true
        default:
            break
        }
        
        isCheckClickButton = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier! {
        case "showPregnentMothers":
            let informationPregnantMothers = segue.destination as! InformationPregnantMothers
            informationPregnantMothers.delagate = self
            displayViewControllerUsingPopOver(viewController: informationPregnantMothers, width: view.frame.width * 0.7, height: view.frame.height * 0.5)
        case "showNewMothers":
            isStatusMom = true
            let informationNewMothers = segue.destination as! InformationNewMothers
            informationNewMothers.delegate = self
            informationNewMothers.isNewMothers = true
            displayViewControllerUsingPopOver(viewController: informationNewMothers, width: view.frame.width * 0.7, height: view.frame.height * 0.5)
        case "showRaisingChildren":
            isStatusMom = false
            let informationNewMothers = segue.destination as! InformationNewMothers
            informationNewMothers.delegate = self
            informationNewMothers.isNewMothers = false
            displayViewControllerUsingPopOver(viewController: informationNewMothers, width: view.frame.width * 0.7, height: view.frame.height * 0.5)
        case "showHomePregnantMothers":
            print("123")
            //            if isCheckClickButton {
            //                if tagButton == 101 {
            //
            //                } else if tagButton == 102 {
            //
            //                } else if tagButton == 103 {
            //
            //                }
            //            } else {
            //                let alert = UIAlertController(title: "Thông báo", message: "Bạn chưa chọn thông tin phù hợp", preferredStyle: .alert)
            //                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            //                present(alert, animated: true, completion: nil)
            //            }
            
        default:
            break
        }
        
    }
    
    // MARK: UIPopoverPresentationControllerDelegate
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
}

extension AdjustViewController: InformationPregnantMothersDelegate {
    func passData(week: Int) {
        self.week = week
        
        statusDefault()
        
        labelOfBaMeMangThai.isHidden = false
        labelWeekOfBaMeMangThai.isHidden = false
        spaceBetweenButtonBaMeMangThaiAndBaMeMoiSinh.constant = 60
        
        labelWeekOfBaMeMangThai.text = "Được \(week) tuần"
    }
}

extension AdjustViewController: InformationNewMothersDelegate {
    func passData1(week: Int, isStatusChildren: Bool) {
        self.week = week
        self.isStatusChildren = isStatusChildren
        
        statusDefault()
        
        if isStatusMom == true {
            labelOfBaMeMoiSinh.isHidden = false
            imgOfBaMeMoiSinh.isHidden = false
            labelStatusChildrenOfBaMeMoiSinh.isHidden = false
            labelWeekOfBaMeMoiSinh.isHidden = false
            spaceBetweenButtonBaMeMoiSinhAndBaMeNuoiConNho.constant = 80
            
            if isStatusChildren {
                imgOfBaMeMoiSinh.image = UIImage(named: "BeTrai")
                labelStatusChildrenOfBaMeMoiSinh.text = "Bé trai"
            } else {
                imgOfBaMeMoiSinh.image = UIImage(named: "BeGai")
                labelStatusChildrenOfBaMeMoiSinh.text = "Bé gái"
            }
            labelWeekOfBaMeMoiSinh.text = "Được \(week) tháng tuổi"
        } else {
            labelOfBaMeNuoiConNho.isHidden = false
            labelWeekOfBaMeNuoiConNho.isHidden = false
            labelStatusChildrenOfBaMeNuoiConNho.isHidden = false
            imgOfBaMeNuoiConNho.isHidden = false
            
            if isStatusChildren {
                imgOfBaMeNuoiConNho.image = UIImage(named: "BeTrai")
                labelStatusChildrenOfBaMeNuoiConNho.text = "Bé trai"
            } else {
                imgOfBaMeNuoiConNho.image = UIImage(named: "BeGai")
                labelStatusChildrenOfBaMeNuoiConNho.text = "Bé gái"
            }
            labelWeekOfBaMeNuoiConNho.text = "Được \(week) tháng tuổi"
        }
    }
}
