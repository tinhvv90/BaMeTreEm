//
//  InformationNewMothers.swift
//  MomChildren
//
//  Created by Mạnh Thường Quân on 11/10/16.
//  Copyright © 2016 buiduyhien. All rights reserved.
//

import UIKit

protocol InformationNewMothersDelegate {
    func passData1(week: Int, isStatusChildren: Bool)
}

class InformationNewMothers: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var monthAgeLabel: UILabel!
    @IBOutlet weak var buttonABoy: UIButton!
    @IBOutlet weak var buttonAGirl: UIButton!
    
    // MARK: Properties
    var isStatusChildren = false
    var arrayWeeks = [Int]()
    var valuePickerView = 0
    var delegate: InformationNewMothersDelegate?
    var isNewMothers: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createDataOfPickerView()
    }
    
    // MARK: Method
    func createDataOfNewMothers() {
        monthAgeLabel.numberOfLines = 2
        monthAgeLabel.text = "THÁNG \n TUỔI"
        for i in 1...12 {
            arrayWeeks.append(i)
        }
        pickerView.selectRow(9, inComponent: 0, animated: true)
    }
    
    func createDataOfRaisingChildren() {
        monthAgeLabel.text = "TUỔI"
        for i in 1...5 {
            arrayWeeks.append(i)
        }
        pickerView.selectRow(2, inComponent: 0, animated: true)
    }
    
    func createDataOfPickerView() {
        if isNewMothers == true {
            createDataOfNewMothers()
        } else {
            createDataOfRaisingChildren()
        }
    }
    
    // MARK: UIPickerViewDataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayWeeks.count
    }
    
    // MARK: UIPickerViewDelegate
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(arrayWeeks[row])
    }

    // MARK: Actions
    @IBAction func informationChildren(_ sender: UIButton) {
        if sender === buttonABoy {
            isStatusChildren = true
        } else if sender === buttonAGirl {
            isStatusChildren = false
        }
    }

    @IBAction func dismissSenseNewMothers(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        let indexOfRowSelect = pickerView.selectedRow(inComponent: 0)
        valuePickerView = arrayWeeks[indexOfRowSelect]
        delegate?.passData1(week: valuePickerView, isStatusChildren: self.isStatusChildren)
    }
}
