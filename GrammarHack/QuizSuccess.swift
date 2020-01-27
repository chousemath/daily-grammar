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
        "You’ve got it made!",
        "Sensational!",
        "You’re doing fine!",
        "Super!",
        "Good going!",
        "That’s good!",
        "Excellent!",
        "Wonderful!",
        "Good work!",
        "You're the best!",
        "Superb!",
        "You did well today!",
        "That’s it!",
        "Keep it up!",
        "Fine!",
        "Outstanding!",
        "Great!",
        "Nice going!",
        "You’re really improving!",
        "I knew you could do it!",
        "Fantastic!",
        "You are learning a lot!",
        "Congratulations!",
        "Tremendous!",
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
