//
//  ViewController.swift
//  GrammarHack
//
//  Created by Joseph Sungpil Choi on 2020/01/19.
//  Copyright © 2020 Paw Kitchen. All rights reserved.
//

import UIKit
class Quest {
    var title = "";
    var subtitle = "";
    var category = "";
    var answer = "";
    var kor = "";
    var phraseStart = "";
    var phraseEnd = "";
    var options: Array<String> = [];
    
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
    
    func match(answer: String) -> Bool {
        return answer == self.answer;
    }
}
class WithOnAbout: Quest {
    init(
        title: String,
        subtitle: String,
        category: String,
        phraseStart: String,
        phraseEnd: String,
        answer: String,
        kor: String
    ) {
        super.init(
            title: title,
            subtitle: subtitle,
            category: category,
            phraseStart: phraseStart,
            phraseEnd: phraseEnd,
            answer: answer,
            kor: kor,
            options: ["with", "on", "about"]
        )
    }
}

var questions: [Quest] = [
    WithOnAbout(
        title: "Prepositions (전치사)",
        subtitle: "with / on / about",
        category: "select-withonabout",
        phraseStart: "May I fill out the form",
        phraseEnd: "a pencil?",
        answer: "with",
        kor: "이 서식을 연필로 작성해도 될까요?"
    ),
    WithOnAbout(
        title: "Prepositions (전치사)",
        subtitle: "with / on / about",
        category: "select-withonabout",
        phraseStart: "My presentation is",
        phraseEnd: "American history.",
        answer: "about",
        kor: "제 프레젠테이션은 미국 문화에 관한 것입니다."
    ),
    WithOnAbout(
        title: "Prepositions (전치사)",
        subtitle: "with / on / about",
        category: "select-withonabout",
        phraseStart: "You can draw a picture",
        phraseEnd: "this paper.",
        answer: "on",
        kor: "이 종이 위해 그림을 그리렴."
    ),
    WithOnAbout(
        title: "Prepositions (전치사)",
        subtitle: "with / on / about",
        category: "select-withonabout",
        phraseStart: "This font size is too small, but I can read it",
        phraseEnd: "glasses.",
        answer: "with",
        kor: "활자체가 너무 작아. 하지만 안경을 쓰면 읽을 수 있겠어."
    ),
    WithOnAbout(
        title: "Prepositions (전치사)",
        subtitle: "with / on / about",
        category: "select-withonabout",
        phraseStart: "Why don't you cut the paper",
        phraseEnd: "scissors?",
        answer: "with",
        kor: "그 종이는 가위로 자르느 게 어때요?"
    ),
    WithOnAbout(
        title: "Prepositions (전치사)",
        subtitle: "with / on / about",
        category: "select-withonabout",
        phraseStart: "We are",
        phraseEnd: "the same page!",
        answer: "on",
        kor: "우린 서로 같은 생각이야!"
    ),
    WithOnAbout(
        title: "Prepositions (전치사)",
        subtitle: "with / on / about",
        category: "select-withonabout",
        phraseStart: "I got the author's autograph",
        phraseEnd: "this book cover.",
        answer: "on",
        kor: "그 책 표지에 저자의 사인을 받았어."
    ),
    WithOnAbout(
        title: "Prepositions (전치사)",
        subtitle: "with / on / about",
        category: "select-withonabout",
        phraseStart: "Who wrote the words",
        phraseEnd: "the whiteboard?",
        answer: "on",
        kor: "칠판에 저거 쓴 사람 누구야?"
    ),
    WithOnAbout(
        title: "Prepositions (전치사)",
        subtitle: "with / on / about",
        category: "select-withonabout",
        phraseStart: "What is your thesis",
        phraseEnd: "?",
        answer: "about",
        kor: "너의 논문은 무엇에 관한 거지?"
    ),
    WithOnAbout(
        title: "Prepositions (전치사)",
        subtitle: "with / on / about",
        category: "select-withonabout",
        phraseStart: "Today's newspaper is all",
        phraseEnd: "the Olympics",
        answer: "about",
        kor: "오늘 신문은 올림픽에 관한 모든 것이 실렸어."
    )
]

class ViewController: UIViewController {
    @IBOutlet var exerciseTitle: UILabel!
    @IBOutlet var exerciseSubtitle: UILabel!
    @IBOutlet var phraseStart: UILabel!
    @IBOutlet var phraseEnd: UILabel!
    @IBOutlet var optionButton: UIButton!
    @IBOutlet var responseTitle: UILabel!
    @IBOutlet var responseBody: UILabel!
    
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
        
        setQuestion()
        
    }
    
    func advanceIndex() {
        if qindex < limit {
            qindex += 1
        } else {
            qindex = 0
            questions.shuffle()
        }
    }
    
    func setQuestion() {
        responseTitle.text = ""
        responseBody.text = ""
        exerciseTitle.text = questions[qindex].title
        exerciseSubtitle.text = questions[qindex].subtitle
        phraseStart.text = questions[qindex].phraseStart
        phraseEnd.text = questions[qindex].phraseEnd
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
        for opt in questions[qindex].options {
            if opt == "" {
                continue
            }
            aSheet.addAction(UIAlertAction(
                title: opt,
                style: .default,
                handler: { action in
                    self.optionButton.setTitle(opt, for: .normal)
                    print(opt)
                    print(questions[self.qindex].answer)
                    print("=====")
                    if questions[self.qindex].match(answer: opt) {
                        self.responseTitle.textColor = UIColor.green
                        self.responseTitle.text = "정답입니다!"
                        self.responseBody.text = questions[self.qindex].kor
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            self.optionButton.setTitle("__________", for: .normal)
                            self.advanceIndex()
                            self.setQuestion()
                        }
                    } else {
                        self.responseTitle.textColor = UIColor.red
                        self.responseTitle.text = "응답이 올바르지 않습니다~"
                        self.responseBody.text = "Please try again!"
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            self.responseTitle.text = ""
                            self.responseBody.text = ""
                        }
                    }
            }
            ))
        }
        aSheet.addAction(cancel)
        present(aSheet, animated: true, completion: nil)
    }
    
}

