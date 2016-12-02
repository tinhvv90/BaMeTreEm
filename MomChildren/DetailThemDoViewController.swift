//
//  DetailThemDoViewController.swift
//  MomChildren
//
//  Created by Mạnh Thường Quân on 12/1/16.
//  Copyright © 2016 buiduyhien. All rights reserved.
//

import UIKit

class DetailThemDoViewController: UIViewController {
    
    @IBOutlet weak var spaceBetweenTextFieldAndTopSuperView: NSLayoutConstraint!
    @IBOutlet weak var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        spaceBetweenTextFieldAndTopSuperView.constant = 0.15 * view.frame.height
    }

}
extension DetailThemDoViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let stuff = Stuff(context: context)
        stuff.name = textField.text
        
        // Save data to core data
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController?.popViewController(animated: true)
        
        return true
    }
}
