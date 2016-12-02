//
//  LichKhamVC.swift
//  MomChildren
//
//  Created by Mạnh Thường Quân on 11/14/16.
//  Copyright © 2016 buiduyhien. All rights reserved.
//

import UIKit

class LichKhamVC: UIViewController, UIPopoverPresentationControllerDelegate, UITableViewDelegate {
    
    // - MARK: Properties
    var month: Int!
    var year: Int!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigation()
    }

    // MARK: Method
    func setupNavigation() {
        navigationItem.title = "Lịch khám"
    }
    
    func displayViewControllerUsingPopOver(viewController: UIViewController, width: CGFloat, height: CGFloat) {
        viewController.popoverPresentationController?.delegate = self
        viewController.popoverPresentationController?.sourceView = self.view
        viewController.preferredContentSize = CGSize(width: width, height: height)
        viewController.popoverPresentationController?.sourceRect = CGRect(x: view.bounds.midX, y: view.bounds.midY, width: 0, height: 0)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDateMonthYear" {
            let popOverDataPicker = segue.destination as! PopoverDataPicker
            displayViewControllerUsingPopOver(viewController: popOverDataPicker, width: view.frame.width, height: view.frame.height * 0.4)
            popOverDataPicker.delegate = self
        }
    }
    
    // MARK: UIPopoverPresentationControllerDelegate
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
    
}

extension LichKhamVC: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    @objc(tableView:cellForRowAtIndexPath:)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        return cell
    }
}

extension LichKhamVC: PopoverDataPickerDelegate {
    func passData(month: Int, year: Int) {
        self.month = month
        self.year = year
    }
}
