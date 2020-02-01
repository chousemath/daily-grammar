//
//  TermsViewController.swift
//  GrammarHack
//
//  Created by Joseph Sungpil Choi on 2020/02/01.
//  Copyright © 2020 Paw Kitchen. All rights reserved.
//


import UIKit
import WebKit

class TermsViewController: UIViewController, WKUIDelegate {
    
    let webView = WKWebView()
    
    override func loadView() {
        self.view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string: "https://chousemath.github.io/GrammarHack-terms") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
}

