//
//  AppInfoViewController.swift
//  GrammarHack
//
//  Created by Joseph Sungpil Choi on 2020/02/01.
//  Copyright © 2020 Paw Kitchen. All rights reserved.
//

import UIKit

class Announcement: Codable {
    let title: String
    let body: String
    let createdAt: String
    
    enum CodingKeys: String, CodingKey {
        case title, body, createdAt
    }
    
    init(title: String, body: String, createdAt: String) {
        self.title = title
        self.body = body
        self.createdAt = createdAt
    }
}

class AppInfoViewController: UIViewController {
    @IBOutlet var appVersionLabel: UILabel!
    @IBOutlet var announcementsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
        appVersionLabel.text = appVersion
    }
}

