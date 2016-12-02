//
//  HomeVC.swift
//  MomChildren
//
//  Created by Mạnh Thường Quân on 11/8/16.
//  Copyright © 2016 buiduyhien. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var bottomConstraintOfButton: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureConstraint()
    }
    
    func configureConstraint() {
        bottomConstraintOfButton.constant = 0.1 * view.frame.height
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showStatusHomeVC" {
            let statusHomeVC = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "StatusHomeVC") as! StatusHomeVC
            present(statusHomeVC, animated: true, completion: nil)
        }
    }
    
}
