//
//  StatusHomeVC.swift
//  MomChildren
//
//  Created by Mạnh Thường Quân on 11/8/16.
//  Copyright © 2016 buiduyhien. All rights reserved.
//

import UIKit

class StatusHomeVC: UIViewController, UIPopoverPresentationControllerDelegate {
    
    @IBOutlet weak var topConstraintOfLabel: NSLayoutConstraint!
    @IBOutlet weak var bottomConstraintOfButton: NSLayoutConstraint!
    @IBOutlet weak var buttonBaMeMangThai: UIButton!
    @IBOutlet weak var buttonBaMeMoiSinh: UIButton!
    @IBOutlet weak var buttonBaMeNuoiConNho: UIButton!
    
    // MARK: Properties
    var tagButton = 0
    var valueWeekPregnentMothers = 0
    var isCheckClickButton = false
    var isStatusChildren: Bool!
    var week: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureConstraint()
        //        buttonBaMeMangThai.isSelected = true
    }
    
    // MARK: Method
    func configureConstraint() {
        topConstraintOfLabel.constant = 0.15 * view.frame.height
        bottomConstraintOfButton.constant = 0.1 * view.frame.height
    }
    
    func restartStatusOfButtons() {
        buttonBaMeMangThai.isSelected = false
        buttonBaMeMoiSinh.isSelected = false
        buttonBaMeNuoiConNho.isSelected = false
    }
    
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
    
    func displayViewControllerUsingPopOver(viewController: UIViewController, width: CGFloat, height: CGFloat) {
        viewController.popoverPresentationController?.delegate = self
        viewController.popoverPresentationController?.sourceView = self.view
        viewController.preferredContentSize = CGSize(width: width, height: height)
        viewController.popoverPresentationController?.sourceRect = CGRect(x: view.bounds.midX, y: view.bounds.midY, width: 0, height: 0)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier! {
        case "showPregnentMothers":
            tagButton = 101
            let informationPregnantMothers = segue.destination as! InformationPregnantMothers
            informationPregnantMothers.delagate = self
            displayViewControllerUsingPopOver(viewController: informationPregnantMothers, width: view.frame.width * 0.7, height: view.frame.height * 0.5)
        case "showNewMothers":
            tagButton = 102
            let informationNewMothers = segue.destination as! InformationNewMothers
            informationNewMothers.delegate = self
            informationNewMothers.isNewMothers = true
            displayViewControllerUsingPopOver(viewController: informationNewMothers, width: view.frame.width * 0.7, height: view.frame.height * 0.5)
        case "showRaisingChildren":
            tagButton = 103
            let informationNewMothers = segue.destination as! InformationNewMothers
            informationNewMothers.delegate = self
            informationNewMothers.isNewMothers = false
            displayViewControllerUsingPopOver(viewController: informationNewMothers, width: view.frame.width * 0.7, height: view.frame.height * 0.5)
        case "showHomePregnantMothers":
            print("showHomePregnantMothers")
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

extension StatusHomeVC: InformationPregnantMothersDelegate {
    func passData(week: Int) {
        self.week = week
    }
}

extension StatusHomeVC: InformationNewMothersDelegate {
    func passData1(week: Int, isStatusChildren: Bool) {
        self.week = week
        self.isStatusChildren = isStatusChildren
    }
}


