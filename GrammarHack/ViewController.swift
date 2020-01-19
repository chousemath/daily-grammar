//
//  ViewController.swift
//  GrammarHack
//
//  Created by Joseph Sungpil Choi on 2020/01/19.
//  Copyright © 2020 Paw Kitchen. All rights reserved.
//

import UIKit

class Question {
    var title = "";
    var subtitle = "";
    var category = "";
    var phraseStart = "";
    var phraseEnd = "";
    var answer = "";
    var kor = "";
    var options: Array<String> = Array(repeating: "", count: 5);
    init(
        title: String,
        subtitle: String,
        category: String,
        phraseStart: String,
        phraseEnd: String,
        answer: String,
        kor: String,
        options: Array<String>
    ) {
        self.title = title;
        self.subtitle = subtitle;
        self.category = category;
        self.phraseStart = phraseStart;
        self.phraseEnd = phraseEnd;
        self.answer = answer;
        self.kor = kor;
        self.options = options;
    }
}

var questions: Array<Question> = [
    Question(
        title: "Prepositions",
        subtitle: "with / on / about",
        category: "select-withonabout",
        phraseStart: "Why don't you cut the paper",
        phraseEnd: "scissors?",
        answer: "with",
        kor: "그 종이는 가위로 자르느 게 어때요?",
        options: ["with", "on", "about", "", ""]
    ),
    Question(
        title: "Prepositions",
        subtitle: "with / on / about",
        category: "select-withonabout",
        phraseStart: "May I fill out the form",
        phraseEnd: "a pencil?",
        answer: "with",
        kor: "이 서식을 연필로 작성해도 될까요?",
        options: ["with", "on", "about", "", ""]
    )
]

class ViewController: UIViewController {
    @IBOutlet var exerciseTitle: UILabel!
    @IBOutlet var exerciseSubtitle: UILabel!
    @IBOutlet var phraseStart: UILabel!
    @IBOutlet var phraseEnd: UILabel!
    @IBOutlet var optionButton: UIButton!
    @IBOutlet var submitButton: UIButton!
    @IBOutlet var responseTitle: UILabel!
    @IBOutlet var responseBody: UILabel!
    
    var options: Array<String> = []
    var answerCorrect: String = ""
    var answerSelected: String = ""
    var kor: String = ""
    
    var qindex: Int = 0
    let limit: Int = questions.count - 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        phraseStart.numberOfLines = 0
        phraseEnd.numberOfLines = 0
        responseTitle.numberOfLines = 0
        responseBody.numberOfLines = 0
        
        // pick a random question to begin with
        questions.shuffle()
        
        setQuestion(question: questions[qindex])
        
    }
    
    func setQuestion(question qst: Question) {
        responseTitle.text = ""
        responseBody.text = ""
        answerSelected = ""
        exerciseTitle.text = qst.title
        exerciseSubtitle.text = qst.subtitle
        phraseStart.text = qst.phraseStart
        phraseEnd.text = qst.phraseEnd
        options = qst.options;
        answerCorrect = qst.answer;
        kor = qst.kor;
        
        if qindex < limit {
            qindex += 1
        } else {
            qindex = 0
            questions.shuffle()
        }
    }
    
    @IBAction func selectorPressed(_ sender: UIButton) {
        print("Option selector was pressed.")
        let aSheet = UIAlertController(
            title: "가능한 답변입니다",
            message: "아래 답변 중 하나를 선택하세요",
            preferredStyle: .actionSheet
        )
        let cancel = UIAlertAction(
            title: "취소",
            style: .cancel,
            handler: nil
        )
        for opt in options {
            if opt == "" {
                continue
            }
            aSheet.addAction(UIAlertAction(
                title: opt,
                style: .default,
                handler: { action in
                    self.answerSelected = opt
                    self.optionButton.setTitle(opt, for: .normal)
            }
            ))
        }
        aSheet.addAction(cancel)
        
        present(aSheet, animated: true, completion: nil)
    }
    
    @IBAction func submitted(_ sender: UIButton) {
        if answerSelected == "" {
            return
        }
        if answerSelected == answerCorrect {
            self.responseTitle.text = "정답입니다!"
            self.responseBody.text = kor
            self.submitButton.isEnabled = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.optionButton.setTitle("__________", for: .normal)
                self.setQuestion(question: questions[self.qindex])
                self.submitButton.isEnabled = true
            }
        } else {
            self.responseTitle.text = "응답이 올바르지 않습니다~"
            self.responseBody.text = "Please try again!"
            return
        }
    }
    
}

