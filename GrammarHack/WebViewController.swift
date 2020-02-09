//
//  FeatureRequestViewController.swift
//  GrammarHack
//
//  Created by Joseph Sungpil Choi on 2020/02/01.
//  Copyright © 2020 Paw Kitchen. All rights reserved.
//

import UIKit
import WebKit

var activityIndicator: UIActivityIndicatorView!
class WebViewController: UIViewController, WKUIDelegate {
    let webView = WKWebView()
    
    override func loadView() {
        self.view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func loadPage(_ urlVal: String) {
        guard let url = URL(string: urlVal) else {
            return
        }
        let request = URLRequest(url: url)
        webView.load(request)
    }
}


