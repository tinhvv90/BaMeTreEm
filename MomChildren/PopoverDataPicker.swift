//
//  PopoverDataPicker.swift
//  MomChildren
//
//  Created by Mạnh Thường Quân on 11/13/16.
//  Copyright © 2016 buiduyhien. All rights reserved.
//

import UIKit

protocol PopoverDataPickerDelegate {
    func passData(month: Int, year: Int)
}

class PopoverDataPicker: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var buttonXong: UIButton!
    @IBOutlet weak var buttonHuy: UIButton!
    
    // MARK: Properties
    var delegate: PopoverDataPickerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func dismissPopOverDataPicker(_ sender: UIButton) {
        if sender === buttonXong {
            dismiss(animated: true, completion: nil)
            let chosenDate = self.datePicker.date
            //use NSCalenda
            let myCalendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier(rawValue: NSGregorianCalendar))
            let myComponents = myCalendar?.components([.month, .year], from: chosenDate)
            let date = myComponents?.date
            let month = myComponents?.month
            let year = myComponents?.year
            
            print("\(date), \(month), \(year)")
            delegate?.passData(month: month!, year: year!)
        } else if sender === buttonHuy {
            dismiss(animated: true, completion: nil)
        }
        
    }
   

}
