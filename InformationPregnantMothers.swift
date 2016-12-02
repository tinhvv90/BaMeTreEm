//
//  InformationPregnantMothers.swift
//  MomChildren
//
//  Created by Mạnh Thường Quân on 11/10/16.
//  Copyright © 2016 buiduyhien. All rights reserved.
//

import UIKit

protocol InformationPregnantMothersDelegate {
    func passData(week: Int)
}

class InformationPregnantMothers: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    // MARK: Properties
    var arrayWeeks = [Int]()
    var valuePickerView = 0
    var delagate: InformationPregnantMothersDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createDataOfPickerView()
    }
    
    // MARK: Method
    func createDataOfPickerView() {
        for i in 1...12 {
            arrayWeeks.append(i)
        }
        // Hiển thị row mặc định khi chạy lên
        pickerView.selectRow(9, inComponent: 0, animated: true)
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
    @IBAction func dismissSensePregnantMothers(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        valuePickerView = pickerView.selectedRow(inComponent: 0) + 1
        delagate?.passData(week: valuePickerView)
    }
    
}
