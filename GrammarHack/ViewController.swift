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
    var options: [String] = [];
    var noKor: Bool = false
    var delay: Double = 3.0
    
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
        assert(!title.isEmpty, "title variable is empty")
        assert(!subtitle.isEmpty, "subtitle variable is empty")
        assert(!category.isEmpty, "category variable is empty")
        assert(!phraseStart.isEmpty, "phraseStart variable is empty")
        assert(!phraseEnd.isEmpty, "phraseEnd variable is empty")
        assert(!answer.isEmpty, "answer variable is empty")
        
        self.title = title;
        self.subtitle = subtitle;
        self.category = category;
        self.phraseStart = phraseStart;
        self.phraseEnd = phraseEnd;
        self.answer = answer;
        self.noKor = kor.isEmpty
        self.kor = self.noKor ? "*한국어 버전은 아직 없습니다*" : kor;
        self.options = options.shuffled();
        if self.noKor {
            self.delay = 1.0
        }
    }
    
    func match(answer: String) -> Bool {
        return answer == self.answer;
    }
}
class WithOnAbout: Quest {
    init(
        phraseStart: String,
        phraseEnd: String,
        answer: String,
        kor: String
    ) {
        super.init(
            title: "Prepositions (전치사)",
            subtitle: "with / on / about",
            category: "select-withonabout",
            phraseStart: phraseStart,
            phraseEnd: phraseEnd,
            answer: answer,
            kor: kor,
            options: ["with", "on", "about"]
        )
    }
}
class AdjOrAdvType: Quest {
    init(
        phraseStart: String,
        answer: String,
        kor: String
    ) {
           super.init(
               title: "Adjectives/Adverbs",
               subtitle: "Ending with -ly",
               category: "select-adjoradvtype",
               phraseStart: phraseStart,
               phraseEnd: "",
               answer: answer,
               kor: kor,
               options: ["adjective (형용사)", "adverb (부사)", "both (형용사+부사)"]
           )
       }
}

class AdjOrAdv: Quest {
    init(
        phraseStart: String,
        phraseEnd: String,
        answer: String,
        kor: String,
        options: [String]
    ) {
        super.init(
            title: "Adjective or Adverb",
            subtitle: "형용사 또는 부사",
            category: "select-adjoradv",
            phraseStart: phraseStart,
            phraseEnd: phraseEnd,
            answer: answer,
            kor: kor,
            options: options
        )
    }
}

var questions: [Quest] = [
    WithOnAbout(
        phraseStart: "May I fill out the form",
        phraseEnd: "a pencil?",
        answer: "with",
        kor: "이 서식을 연필로 작성해도 될까요?"
    ),
    WithOnAbout(
        phraseStart: "My presentation is",
        phraseEnd: "American history.",
        answer: "about",
        kor: "제 프레젠테이션은 미국 문화에 관한 것입니다."
    ),
    WithOnAbout(
        phraseStart: "You can draw a picture",
        phraseEnd: "this paper.",
        answer: "on",
        kor: "이 종이 위해 그림을 그리렴."
    ),
    WithOnAbout(
        phraseStart: "This font size is too small, but I can read it",
        phraseEnd: "glasses.",
        answer: "with",
        kor: "활자체가 너무 작아. 하지만 안경을 쓰면 읽을 수 있겠어."
    ),
    WithOnAbout(
        phraseStart: "Why don't you cut the paper",
        phraseEnd: "scissors?",
        answer: "with",
        kor: "그 종이는 가위로 자르느 게 어때요?"
    ),
    WithOnAbout(
        phraseStart: "We are",
        phraseEnd: "the same page!",
        answer: "on",
        kor: "우린 서로 같은 생각이야!"
    ),
    WithOnAbout(
        phraseStart: "I got the author's autograph",
        phraseEnd: "this book cover.",
        answer: "on",
        kor: "그 책 표지에 저자의 사인을 받았어."
    ),
    WithOnAbout(
        phraseStart: "Who wrote the words",
        phraseEnd: "the whiteboard?",
        answer: "on",
        kor: "칠판에 저거 쓴 사람 누구야?"
    ),
    WithOnAbout(
        phraseStart: "What is your thesis",
        phraseEnd: "?",
        answer: "about",
        kor: "너의 논문은 무엇에 관한 거지?"
    ),
    WithOnAbout(
        phraseStart: "Today's newspaper is all",
        phraseEnd: "the Olympics",
        answer: "about",
        kor: "오늘 신문은 올림픽에 관한 모든 것이 실렸어."
    ),
    AdjOrAdv(
        phraseStart: "He",
        phraseEnd: "reads a book.",
        answer: "quickly",
        kor: "",
        options: ["quick", "quicker", "quickest", "quickly"]
    ),
    AdjOrAdv(
        phraseStart: "Sue is a",
        phraseEnd: "girl working at Starbucks.",
        answer: "pretty",
        kor: "",
        options: ["pretty", "prettily", "prettiness", "prettyish"]
    ),
    AdjOrAdv(
        phraseStart: "My biology class is",
        phraseEnd: "loud today.",
        answer: "terribly",
        kor: "",
        options: ["terrible", "terribly", "terribleness"]
    ),
    AdjOrAdv(
        phraseStart: "Today was a",
        phraseEnd: "day. I lost my wallet.",
        answer: "terrible",
        kor: "",
        options: ["terrible", "terribly", "terribleness"]
    ),
    AdjOrAdv(
        phraseStart: "Jeremy is so strong, he can",
        phraseEnd: "open this can of soup.",
        answer: "easily",
        kor: "",
        options: ["easy", "easily", "easier", "easiest"]
    ),
    AdjOrAdv(
        phraseStart: "Joanna drives slowly because she is a",
        phraseEnd: "driver.",
        answer: "careful",
        kor: "",
        options: ["careful", "carefully", "carefulness", "carefree"]
    ),
    AdjOrAdv(
        phraseStart: "Whenever it rains, Jim drives very",
        phraseEnd: "because he wants to be safe.",
        answer: "carefully",
        kor: "",
        options: ["careful", "carefully", "carefulness", "carefree"]
    ),
    AdjOrAdv(
        phraseStart: "Be very",
        phraseEnd: "with this glass of milk. It's hot.",
        answer: "careful",
        kor: "",
        options: ["careful", "carefully", "carefulness", "carefree"]
    ),
    AdjOrAdv(
        phraseStart: "The dog across the street barks",
        phraseEnd: "whenever I walk near his home.",
        answer: "loudly",
        kor: "",
        options: ["loud", "loudly"]
    ),
    AdjOrAdv(
        phraseStart: "The bus driver was",
        phraseEnd: "injured in the accident.",
        answer: "seriously",
        kor: "",
        options: ["serious", "seriously", "seriousness"]
    ),
    AdjOrAdv(
        phraseStart: "Kevin is",
        phraseEnd: "clever. He solved the math problem in under 5 minutes.",
        answer: "extremely",
        kor: "",
        options: ["extreme", "extremely", "extremism", "extremist"]
    ),
    AdjOrAdv(
        phraseStart: "This hamburger tastes",
        phraseEnd: ". I will never return to this restaurant.",
        answer: "awful",
        kor: "",
        options: ["awful", "awfully", "awfulness"]
    ),
    AdjOrAdv(
        phraseStart: "Robin looks",
        phraseEnd: ". What's the matter with him?",
        answer: "sad",
        kor: "",
        options: ["sad", "sadden", "saddened"]
    ),
    AdjOrAdvType(
        phraseStart: "slowly",
        answer: "adverb (부사)",
        kor: ""
    ),
    AdjOrAdvType(
        phraseStart: "carefully",
        answer: "adverb (부사)",
        kor: ""
    ),
    AdjOrAdvType(
        phraseStart: "quickly",
        answer: "adverb (부사)",
        kor: ""
    ),
    AdjOrAdvType(
        phraseStart: "heavily",
        answer: "adverb (부사)",
        kor: ""
    ),
    AdjOrAdvType(
        phraseStart: "badly",
        answer: "adverb (부사)",
        kor: ""
    ),
    AdjOrAdvType(
        phraseStart: "suddenly",
        answer: "adverb (부사)",
        kor: ""
    ),
    AdjOrAdvType(
        phraseStart: "hungrily",
        answer: "adverb (부사)",
        kor: ""
    ),
    AdjOrAdvType(
        phraseStart: "generally",
        answer: "adverb (부사)",
        kor: ""
    ),
    AdjOrAdvType(
        phraseStart: "fully",
        answer: "adverb (부사)",
        kor: ""
    ),
    AdjOrAdvType(
        phraseStart: "friendly",
        answer: "adjective (형용사)",
        kor: ""
    ),
    AdjOrAdvType(
        phraseStart: "lonely",
        answer: "adjective (형용사)",
        kor: ""
    ),
    AdjOrAdvType(
        phraseStart: "ugly",
        answer: "adjective (형용사)",
        kor: ""
    ),
    AdjOrAdvType(
        phraseStart: "lovely",
        answer: "adjective (형용사)",
        kor: ""
    ),
    AdjOrAdvType(
        phraseStart: "silly",
        answer: "adjective (형용사)",
        kor: ""
    ),
    AdjOrAdvType(
        phraseStart: "lively",
        answer: "adjective (형용사)",
        kor: ""
    ),
    AdjOrAdvType(
        phraseStart: "unlikely",
        answer: "adjective (형용사)",
        kor: ""
    ),
    AdjOrAdvType(
        phraseStart: "daily",
        answer: "both (형용사+부사)",
        kor: ""
    ),
    AdjOrAdvType(
        phraseStart: "weekly",
        answer: "both (형용사+부사)",
        kor: ""
    ),
    AdjOrAdvType(
        phraseStart: "yearly",
        answer: "both (형용사+부사)",
        kor: ""
    ),
    AdjOrAdvType(
        phraseStart: "monthly",
        answer: "both (형용사+부사)",
        kor: ""
    ),
    AdjOrAdvType(
        phraseStart: "early",
        answer: "both (형용사+부사)",
        kor: ""
    )
    //    options: ["adjective (형용사)", "adverb (부사)", "both (형용사+부사)"]
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
                    let q = questions[self.qindex]
                    if q.match(answer: opt) {
                        self.responseTitle.textColor = UIColor.green
                        self.responseTitle.text = "정답입니다!"
                        self.responseBody.text = q.kor
                        DispatchQueue.main.asyncAfter(deadline: .now() + q.delay) {
                            self.optionButton.setTitle("__________", for: .normal)
                            self.advanceIndex()
                            self.setQuestion()
                        }
                    } else {
                        self.responseTitle.textColor = UIColor.red
                        self.responseTitle.text = "응답이 올바르지 않습니다~"
                        self.responseBody.text = "Please try again!"
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
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

