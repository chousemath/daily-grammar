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
    @IBOutlet var announcementTitle: UILabel!
    @IBOutlet var announcementsLabel: UILabel!
    @IBOutlet var announcementCreatedAt: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
        appVersionLabel.text = appVersion
        let session = URLSession.shared
        guard let url = URL(string: "https://raw.githubusercontent.com/chousemath/daily-grammar/master/announcement.json") else {
            return
        }
        let task = session.dataTask(with: url, completionHandler: { data, response, error in
            if error != nil {
                return
            }
            
            // Serialize the data into an object
            do {
                let json = try JSONDecoder().decode(Announcement.self, from: data! )
                print(json.title)
                DispatchQueue.main.async {
                    self.announcementTitle.text = json.title
                    self.announcementsLabel.text = json.body
                    self.announcementCreatedAt.text = json.createdAt
                }
            } catch {
                print("Error during JSON serialization: \(error.localizedDescription)")
            }
        })
        task.resume()
    }
}

