//
//  QuizSuccess.swift
//  GrammarHack
//
//  Created by Joseph Sungpil Choi on 2020/01/27.
//  Copyright © 2020 Paw Kitchen. All rights reserved.
//

import UIKit

class QuizSuccess: UIViewController {
    let congrats: [String] = [
        "나는 마침내 남극으로 돌아갈 수 있습니다!",
        "드디어 고국으로 돌아갈 수 있어요!",
    ]
    
    @IBOutlet var labelCongrats: UILabel!
    @IBOutlet var labelAcc: UILabel!
    @IBOutlet var handleBye: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelCongrats.text = congrats.randomElement()
        handleBye.layer.cornerRadius = 8
    }
    
    @IBAction func handleLeave(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
