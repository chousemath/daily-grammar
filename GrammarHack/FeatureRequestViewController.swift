//
//  FeatureRequestViewController.swift
//  GrammarHack
//
//  Created by Joseph Sungpil Choi on 2020/02/01.
//  Copyright © 2020 Paw Kitchen. All rights reserved.
//

import UIKit
import WebKit

class FeatureRequestViewController: UIViewController, WKUIDelegate {
    
    let webView = WKWebView()
    
    override func loadView() {
        self.view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string: "https://docs.google.com/forms/d/e/1FAIpQLSdTKKpdL_t3M0BOvNFqAxln_QI9WZNOxb2ePFOlvuCtMU7Ikg/viewform?embedded=true") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
}


