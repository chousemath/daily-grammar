//
//  EncouragementViewController.swift
//  GrammarHack
//
//  Created by Joseph Sungpil Choi on 2020/02/01.
//  Copyright © 2020 Paw Kitchen. All rights reserved.
//

import UIKit

class EncouragementViewController: UIViewController {
    
    @IBOutlet var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func handleDismissPress(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

