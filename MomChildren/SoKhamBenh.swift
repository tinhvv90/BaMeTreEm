//
//  SoKhamBenh.swift
//  MomChildren
//
//  Created by Mạnh Thường Quân on 11/13/16.
//  Copyright © 2016 buiduyhien. All rights reserved.
//

import UIKit

class SoKhamBenh: UIViewController, UIPopoverPresentationControllerDelegate {
    
    
    @IBOutlet weak var buttonDate: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigation()
    }
    
    // MARK: Method
    func setupNavigation() {
        navigationItem.title = "Tin tuc mới nhất"
    }
    
    func displayViewControllerUsingPopOver(viewController: UIViewController, width: CGFloat, height: CGFloat) {
        viewController.popoverPresentationController?.delegate = self
        viewController.popoverPresentationController?.sourceView = self.view
        viewController.preferredContentSize = CGSize(width: width, height: height)
        viewController.popoverPresentationController?.sourceRect = CGRect(x: view.bounds.midX, y: view.bounds.midY, width: 0, height: 0)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDatePicker" {
            let popOverDataPicker = segue.destination as! PopoverDataPicker
            displayViewControllerUsingPopOver(viewController: popOverDataPicker, width: view.frame.width, height: view.frame.height * 0.5)
        }
    }
    
    // MARK: UIPopoverPresentationControllerDelegate
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}
