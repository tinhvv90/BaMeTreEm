//
//  DetailNewsVC.swift
//  MomChildren
//
//  Created by Mạnh Thường Quân on 11/16/16.
//  Copyright © 2016 buiduyhien. All rights reserved.
//

import UIKit

class DetailNewsVC: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var webView: UIWebView!
    // MARK: Properties
    var urlHTML: String!
    var titleOfNavigation: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        webView.delegate = self
        reqestWebView()
        setupNavigation()
    }
    
    func setupNavigation() {
        navigationItem.title = titleOfNavigation
    }
    
    func reqestWebView() {
        let url = URL(fileURLWithPath: urlHTML)
        webView.loadHTMLString(urlHTML, baseURL: url)
    }

}
