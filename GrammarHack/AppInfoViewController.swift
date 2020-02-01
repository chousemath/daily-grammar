//
//  AppInfoViewController.swift
//  GrammarHack
//
//  Created by Joseph Sungpil Choi on 2020/02/01.
//  Copyright © 2020 Paw Kitchen. All rights reserved.
//

import UIKit

class AppInfoViewController: UIViewController {
    @IBOutlet var appVersionLabel: UILabel!
    @IBOutlet var announcementsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
        appVersionLabel.text = appVersion
    }
}

