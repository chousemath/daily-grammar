//
//  ViewController.swift
//  GrammarHack
//
//  Created by Joseph Sungpil Choi on 2020/01/19.
//  Copyright © 2020 Paw Kitchen. All rights reserved.
//

import UIKit
import AVFoundation
import Speech

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
        options: Array<String>,
        shuffled: Bool
    ) {
        assert(!category.isEmpty, "category variable is empty")
        assert(!answer.isEmpty, "answer variable is empty")
        
        self.title = title;
        self.subtitle = subtitle;
        self.category = category;
        self.phraseStart = phraseStart;
        self.phraseEnd = phraseEnd;
        self.answer = answer;
        self.noKor = kor.isEmpty
        self.kor = self.noKor ? "*한국어 버전은 아직 없습니다*" : kor;
        if shuffled {
            self.options = options.shuffled();
        } else {
            self.options = options;
        }
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
            options: ["with", "on", "about"],
            shuffled: true
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
               options: ["adjective (형용사)", "adverb (부사)", "both (형용사+부사)"],
               shuffled: true
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
            options: options,
            shuffled: true
        )
    }
}

class AdvFreq: Quest {
    init(
        phraseStart: String,
        phraseEnd: String,
        answer: String,
        kor: String,
        options: [String]
    ) {
        super.init(
            title: "Adverbs of Frequency",
            subtitle: "올바른 옵션을 선택하세요",
            category: "select-advfreq",
            phraseStart: phraseStart,
            phraseEnd: phraseEnd,
            answer: answer,
            kor: kor,
            options: options,
            shuffled: true
        )
    }
}

class QuestPos: Quest {
    init(
        phraseStart: String,
        phraseEnd: String,
        answer: Int,
        kor: String,
        count: Int
    ) {
        assert(count > 1, "count value is too small")
        let options = (1...count).map { "Position (\($0))" }
        super.init(
            title: "Word Position",
            subtitle: "단어의 올바른 위치를 선택하세요",
            category: "select-position",
            phraseStart: phraseStart,
            phraseEnd: phraseEnd,
            answer: "Position (\(answer))",
            kor: kor,
            options: options,
            shuffled: false
        )
    }
}

class Reading: Quest {
    init(answer: String, kor: String) {
        super.init(
            title: "영어 발음 연습",
            subtitle: "",
            category: "reading",
            phraseStart: "",
            phraseEnd: "",
            answer: answer,
            kor: kor,
            options: [],
            shuffled: false
        )
    }
}

class AdjComp: Quest {
    init(
        phraseStart: String,
        phraseEnd: String,
        answer: String,
        kor: String,
        options: [String]
    ) {
        super.init(
            title: "Adjective Comparison",
            subtitle: "올바른 옵션을 선택하세요",
            category: "select-adjcomp",
            phraseStart: phraseStart,
            phraseEnd: phraseEnd,
            answer: answer,
            kor: kor,
            options: options,
            shuffled: true
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
        phraseStart: "My final presentation is",
        phraseEnd: "American history.",
        answer: "about",
        kor: "제 프레젠테이션은 미국 문화에 관한 것입니다."
    ),
    WithOnAbout(
        phraseStart: "You can draw a picture",
        phraseEnd: "this piece of paper.",
        answer: "on",
        kor: "이 종이 위해 그림을 그리렴."
    ),
    WithOnAbout(
        phraseStart: "This font size is too small, but I can read it",
        phraseEnd: "glasses. Please make it bigger!",
        answer: "with",
        kor: "활자체가 너무 작아. 하지만 안경을 쓰면 읽을 수 있겠어."
    ),
    WithOnAbout(
        phraseStart: "Why don't you cut the paper",
        phraseEnd: "scissors instead of using a knife?",
        answer: "with",
        kor: "그 종이는 가위로 자르느 게 어때요?"
    ),
    WithOnAbout(
        phraseStart: "I think that we are definitely",
        phraseEnd: "the same page!",
        answer: "on",
        kor: "우린 서로 같은 생각이야!"
    ),
    WithOnAbout(
        phraseStart: "I finally got my favorite author's autograph",
        phraseEnd: "the cover of my book. I am so excited!",
        answer: "on",
        kor: "그 책 표지에 저자의 사인을 받았어."
    ),
    WithOnAbout(
        phraseStart: "Who wrote this beautiful poem",
        phraseEnd: "the whiteboard?",
        answer: "on",
        kor: "칠판에 저거 쓴 사람 누구야?"
    ),
    WithOnAbout(
        phraseStart: "What is your class report",
        phraseEnd: "? It is so complicated!",
        answer: "about",
        kor: "너의 논문은 무엇에 관한 거지?"
    ),
    WithOnAbout(
        phraseStart: "Today's newspaper is all",
        phraseEnd: "the Winter Olympics.",
        answer: "about",
        kor: "오늘 신문은 올림픽에 관한 모든 것이 실렸어."
    ),
    AdjOrAdv(
        phraseStart: "John can",
        phraseEnd: "read books about chemistry because that was his major in college.",
        answer: "quickly",
        kor: "",
        options: ["quick", "quicker", "quickest", "quickly"]
    ),
    AdjOrAdv(
        phraseStart: "Sue is a",
        phraseEnd: "girl working at Starbucks. I want to get her phone number!",
        answer: "pretty",
        kor: "",
        options: ["pretty", "prettily", "prettiness", "prettyish"]
    ),
    AdjOrAdv(
        phraseStart: "My biology class is",
        phraseEnd: "loud today. I wish everyone would be quiet.",
        answer: "terribly",
        kor: "",
        options: ["terrible", "terribly", "terribleness"]
    ),
    AdjOrAdv(
        phraseStart: "Today was a",
        phraseEnd: "day. I lost my wallet and a large amount of cash.",
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
        phraseEnd: "and considerate driver.",
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
        phraseStart: "Robin looks so",
        phraseEnd: "today. What's the matter with him?",
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
    ),
    AdvFreq(
        phraseStart: "We",
        phraseEnd: "to school by bus.",
        answer: "always go",
        kor: "",
        options: ["always go", "go always"]
    ),
    AdvFreq(
        phraseStart: "I",
        phraseEnd: "my room on Saturdays.",
        answer: "often clean",
        kor: "",
        options: ["often clean", "clean often"]
    ),
    AdvFreq(
        phraseStart: "They",
        phraseEnd: "tablets in the classroom.",
        answer: "sometimes use",
        kor: "",
        options: ["sometimes use", "use sometimes"]
    ),
    AdvFreq(
        phraseStart: "He",
        phraseEnd: "home before 8 pm.",
        answer: "never gets",
        kor: "",
        options: ["never gets", "gets never"]
    ),
    AdvFreq(
        phraseStart: "The children",
        phraseEnd: "YouTube videos.",
        answer: "often watch",
        kor: "",
        options: ["often watch", "watch often"]
    ),
    AdvFreq(
        phraseStart: "James, my roommate,",
        phraseEnd: "his bed on Saturday mornings. It drives me crazy!",
        answer: "seldom makes",
        kor: "",
        options: ["seldom makes", "makes seldom"]
    ),
    AdvFreq(
        phraseStart: "Do they",
        phraseEnd: "to the supermarket? It's so close to their house!",
        answer: "never walk",
        kor: "",
        options: ["never walk", "walk never"]
    ),
    AdvFreq(
        phraseStart: "We don't",
        phraseEnd: "coffee for breakfast. Sometimes we have juice instead!",
        answer: "always have",
        kor: "",
        options: ["always have", "have always"]
    ),
    AdvFreq(
        phraseStart: "Sally, my neighbor,",
        phraseEnd: "basketball in the afternoon.",
        answer: "always plays",
        kor: "",
        options: ["always plays", "plays always"]
    ),
    AdvFreq(
        phraseStart: "My friend, Mrs. Johnson,",
        phraseEnd: "a shower when she gets home in the evening.",
        answer: "often takes",
        kor: "",
        options: ["often takes", "takes often"]
    ),
    AdvFreq(
        phraseStart: "My wife and I",
        phraseEnd: "fishing at the lake.",
        answer: "sometimes go",
        kor: "",
        options: ["sometimes go", "go sometimes"]
    ),
    AdvFreq(
        phraseStart: "Jeremy and Jinho",
        phraseEnd: "enough time to finish their homework.",
        answer: "never have",
        kor: "",
        options: ["never have", "have never"]
    ),
    AdvFreq(
        phraseStart: "Where do you",
        phraseEnd: "your summer holidays?",
        answer: "usually spend",
        kor: "",
        options: ["usually spend", "spend usually"]
    ),
    AdjComp(
        phraseStart: "This is a nice cat. It's much",
        phraseEnd: "than my friend's cat.",
        answer: "nicer",
        kor: "",
        options: ["nice", "nicest", "nicer", "mean", "meaner", "meanest"]
    ),
    AdjComp(
        phraseStart: "Here is Emily. She's six years old. Her brother is nine, so he is",
        phraseEnd: ".",
        answer: "older than she is.",
        kor: "",
        options: ["older than she is.", "younger than she is."]
    ),
    QuestPos(
        phraseStart: "Our (1) friends must (2) take (3) a test.",
        phraseEnd: "(also)",
        answer: 2,
        kor: "Our friends must also take a test.",
        count: 3
    ),
    QuestPos(
        phraseStart: "I (1) was (2) joking.",
        phraseEnd: "(only)",
        answer: 2,
        kor: "I was only joking.",
        count: 2
    ),
    QuestPos(
        phraseStart: "Did (1) you (2) enjoy (3) the flight?",
        phraseEnd: "(both)",
        answer: 2,
        kor: "Did you both enjoy the flight?",
        count: 3
    ),
    QuestPos(
        phraseStart: "Mary (1) watches (2) TV.",
        phraseEnd: "(hardly ever)",
        answer: 1,
        kor: "Mary hardly ever watches TV.",
        count: 2
    ),
    QuestPos(
        phraseStart: "He drives (1) his (2) car (3).",
        phraseEnd: "(carefully)",
        answer: 3,
        kor: "He drives his car carefully.",
        count: 3
    ),
    QuestPos(
        phraseStart: "The children (1) play (2) football (3).",
        phraseEnd: "(in the garden)",
        answer: 3,
        kor: "The children play football in the garden.",
        count: 3
    ),
    QuestPos(
        phraseStart: "We (1) went to the (2) cinema (3).",
        phraseEnd: "(yesterday)",
        answer: 3,
        kor: "We went to the cinema yesterday.",
        count: 3
    ),
    QuestPos(
        phraseStart: "John (1) fell (2) off (3) the bike.",
        phraseEnd: "(almost)",
        answer: 1,
        kor: "John almost fell off the bike.",
        count: 3
    ),
    QuestPos(
        phraseStart: "Her (1) boyfriend will (2) buy her some (3) flowers.",
        phraseEnd: "(probably)",
        answer: 2,
        kor: "Her boyfriend will probably buy her some flowers.",
        count: 3
    ),
    QuestPos(
        phraseStart: "My uncle is (1) moving (2) to Stockholm soon (3).",
        phraseEnd: "(definitely)",
        answer: 1,
        kor: "My uncle is definitely moving to Stockholm soon.",
        count: 3
    ),
    Reading(
        answer: "I am frequently late, so my teacher doesn’t like me.",
        kor: "저는 지각을 많이 해서, 선생님 눈 밖에 났어요."
    ),
    Reading(
        answer: "If you are tired, get some sleep.",
        kor: "피곤하면 눈 좀 붙여요."
    ),
    Reading(
        answer: "Take me to the hospital.",
        kor: "병원에 가주세요."
    ),
    Reading(
        answer: "I need a doctor.",
        kor: "의사가 필요해요."
    ),
    Reading(
        answer: "Have a nice day!",
        kor: "좋은 하루 보내세요!"
    ),
    Reading(
        answer: "Have a good trip!",
        kor: "여행 잘하세요!"
    ),
    Reading(
        answer: "Where is the bathroom?",
        kor: "화장실은 어디에 있어요?"
    ),
    Reading(
        answer: "Please repeat that.",
        kor: "다시 말해 주세요."
    ),
    Reading(
        answer: "Please speak slowly.",
        kor: "천천히 말해 주세요."
    ),
    Reading(
        answer: "Please write it down.",
        kor: "적어 주세요."
    ),
    Reading(
        answer: "I understand.",
        kor: "이해해요."
    ),
    Reading(
        answer: "I don’t understand.",
        kor: "이해 못해요."
    ),
    Reading(
        answer: "I don’t know.",
        kor: "몰라요."
    ),
    Reading(
        answer: "Can you speak Korean?",
        kor: "한국말을 할 수 있어요?"
    ),
    Reading(
        answer: "I can speak a little Korean.",
        kor: "한국말을 조금 할 수 있어요."
    ),
    Reading(
        answer: "I can’t speak Korean.",
        kor: "한국말을 못해요."
    ),
    Reading(
        answer: "How much is this?",
        kor: "이거 얼마예요?"
    ),
    Reading(
        answer: "I’ll be right back!",
        kor: "금방 갔다 올거예요!"
    ),
    Reading(
        answer: "What is this?",
        kor: "이게 뭐예요?"
    ),
    Reading(
        answer: "Don’t worry!",
        kor: "걱정 하지 마세요!"
    ),
    Reading(
        answer: "No problem!",
        kor: "문제 없어요!"
    ),
    Reading(
        answer: "Please give me a menu.",
        kor: "메뉴판 주세요."
    ),
    Reading(
        answer: "Do you have vegetarian dishes?",
        kor: "채식주의자용 식사 있어요?"
    ),
    Reading(
        answer: "Is this spicy?",
        kor: "이거 매워요?"
    ),
    Reading(
        answer: "Please do not make this spicy.",
        kor: "맵지 않게 요리해 주세요."
    ),
    Reading(
        answer: "It’s delicious!",
        kor: "맛있어요!"
    ),
    Reading(
        answer: "It was a delicious meal!",
        kor: "잘 먹었습니다!"
    ),
    Reading(
        answer: "What time do you close?",
        kor: "몇시에 문 닫아요?"
    ),
    Reading(
        answer: "Do you take credit cards?",
        kor: "카드 돼요?"
    ),
    Reading(
        answer: "I’d like to eat here.",
        kor: "여기서 먹고 갈게요."
    ),
    Reading(
        answer: "Please throw away my receipt",
        kor: "영수증은 버려 주세요."
    ),
    Reading(
        answer: "Do you have electrical outlets?",
        kor: "콘센트 있어요?"
    ),
    Reading(
        answer: "Where are your electrical outlets?",
        kor: "콘센트 어디에 있어요?"
    ),
    Reading(
        answer: "Please give me a receipt.",
        kor: "영수증 주세요."
    ),
    Reading(
        answer: "Please give me a discount.",
        kor: "좀 깎아 주세요."
    ),
    Reading(
        answer: "How much is it?",
        kor: "얼마예요?"
    ),
    Reading(
        answer: "Please give me a refund.",
        kor: "환불해 주세요."
    ),
    Reading(
        answer: "Please exchange this.",
        kor: "교환해 주세요."
    ),
    Reading(
        answer: "Please wrap it for me.",
        kor: "포장해 주세요."
    ),
    Reading(
        answer: "Please dry clean this for me.",
        kor: "드라이 해 주세요."
    ),
    Reading(
        answer: "Please iron this for me.",
        kor: "다림질 해 주세요."
    ),
    Reading(
        answer: "Please make this longer.",
        kor: "기장을 늘려 주세요."
    ),
    Reading(
        answer: "Please make this shorter.",
        kor: "기장을 줄여 주세요."
    ),
    Reading(
        answer: "Please sew on this button.",
        kor: "단추 붙여주세요."
    ),
    Reading(
        answer: "Can you remove this stain?",
        kor: "얼룩 뺄 수 있어요?"
    ),
    Reading(
        answer: "When can I pick up my clothes?",
        kor: "옷을 언제 받을 수 있어요?"
    ),
    Reading(
        answer: "I’m here to pick up my clothes.",
        kor: "제 옷을 찾으러 왔어요."
    ),
    Reading(
        answer: "How much is the total?",
        kor: "모두 얼마예요?"
    ),
    Reading(
        answer: "I would like to open a new bank account.",
        kor: "통장을 만들고 싶어요."
    ),
    Reading(
        answer: "I would like an check card",
        kor: "체크 카드를 만들고 싶어요."
    )
]

class ViewController: UIViewController {
    var speechEnabled: Bool = false
    var transcript: String = ""
    let audioEngine = AVAudioEngine()
    let speechRecognizer = SFSpeechRecognizer()
    let request = SFSpeechAudioBufferRecognitionRequest()
    var recognitionTask: SFSpeechRecognitionTask?
    var qindex: Int = 0
    var scoreVal: Int = 0
    var player: AVAudioPlayer?
    var readAnswer: String = ""
    let limit: Int = questions.count - 1
    let scoreLimit: Int = 20
    
    @IBOutlet var exerciseTitle: UILabel!
    @IBOutlet var exerciseSubtitle: UILabel!
    @IBOutlet var phraseStart: UILabel!
    @IBOutlet var phraseEnd: UILabel!
    @IBOutlet var optionButton: UIButton!
    @IBOutlet var responseTitle: UILabel!
    @IBOutlet var responseBody: UILabel!
    @IBOutlet var score: UILabel!
    @IBOutlet var recordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        phraseStart.numberOfLines = 0
        phraseEnd.numberOfLines = 0
        responseTitle.numberOfLines = 0
        responseBody.numberOfLines = 0
        
        // pick a random question to begin with
        questions.shuffle()
        setQuestion()
        setScore()
        
        SFSpeechRecognizer.requestAuthorization{ (authStatus) in
            switch authStatus {
            case .authorized:
                self.speechEnabled = true
            case .denied:
                self.speechEnabled = false
            case .restricted:
                self.speechEnabled = false
            case .notDetermined:
                self.speechEnabled = false
            @unknown default:
                return
            }
        }
        
        
        switch AVAudioSession.sharedInstance().recordPermission {
        case AVAudioSession.RecordPermission.granted:
            print("Permission granted")
        case AVAudioSession.RecordPermission.denied:
            print("Pemission denied")
        case AVAudioSession.RecordPermission.undetermined:
            print("Request permission here")
            AVAudioSession.sharedInstance().requestRecordPermission({ (granted) in
                // Handle granted
            })
        @unknown default:
            return
        }
    }
    
    func normalize(text: String) -> String {
        let okayChars : Set<Character> =
            Set("abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLKMNOPQRSTUVWXYZ1234567890")
        return String(text.filter {okayChars.contains($0) }).lowercased()
    }
    
    func startRecording() {
        do {
            let node = audioEngine.inputNode
            node.removeTap(onBus: 0)
            let recordingFormat = node.outputFormat(forBus: 0)
            node.installTap(onBus: 0, bufferSize: 1024,
                            format: recordingFormat) { [unowned self]
                                (buffer, _) in
                                self.request.append(buffer)
            }
            audioEngine.prepare()
            try audioEngine.start()
            var matched = false
            recognitionTask = speechRecognizer?.recognitionTask(with: request) {
                [unowned self]
                (result, _) in
                if let transcription = result?.bestTranscription {
                    self.responseBody.text = transcription.formattedString
                    self.transcript = self.normalize(text: transcription.formattedString)
                    if self.transcript == self.readAnswer {
                        self.stopRecording()
                        matched = true
                        self.scoreVal += 1
                        self.responseTitle.textColor = UIColor.green
                        self.responseTitle.text = "정답입니다!"
                        self.setScore()
                        self.playSuccessSound()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            self.advanceQuestion()
                        }
                    }
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                if matched {
                    return
                }
                self.stopRecording()
                self.responseTitle.textColor = UIColor.red
                self.responseTitle.text = "응답이 올바르지 않습니다~"
                self.playFailureSound()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.advanceQuestion()
                }
            }
        } catch let error {
            print("There was problem recording \(error.localizedDescription)")
        }
    }
    
    func stopRecording() {
        audioEngine.stop()
        request.endAudio()
        recognitionTask?.cancel()
        print("Recording stopped")
    }
    
    func skip() {
        self.stopRecording()
    }
    
    let successSounds = [
        "coin",
        "msgBlock"
    ]
    
    let failureSounds = [
        "peng01"
    ]
    
    func playSuccessSound() {
        if let fileName = successSounds.randomElement() {
            playSound(fileName: fileName)
        }
    }
    
    func playFailureSound() {
        if let fileName = failureSounds.randomElement() {
            playSound(fileName: fileName)
        }
    }
    
    func playSound(fileName: String) {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "mp3") else {
            print("\(fileName).mp3 could not be found.")
            return
        }
        do {
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            player?.play()
        } catch let error {
            print(error.localizedDescription)
        }
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
        let q = questions[qindex]
        if q.category == "reading" {
            responseTitle.text = ""
            responseBody.text = ""
            exerciseTitle.text = q.title
            exerciseSubtitle.text = q.subtitle
            phraseStart.text = q.answer
            phraseEnd.text = q.kor
            readAnswer = normalize(text: q.answer)
            recordButton.isEnabled = true
            recordButton.isHidden = false
            optionButton.isHidden = true
            return
        }
        optionButton.isHidden = false
        recordButton.isHidden = true
        responseTitle.text = ""
        responseBody.text = ""
        exerciseTitle.text = q.title
        exerciseSubtitle.text = q.subtitle
        phraseStart.text = q.phraseStart
        phraseEnd.text = q.phraseEnd
    }
    
    func setScore() {
        if scoreVal >= scoreLimit {
            scoreVal = 0
            playSound(fileName: "cheer01")
        }
        score.text = "\(scoreVal)/\(scoreLimit)"
    }
    
    func advanceQuestion() -> () {
        optionButton.setTitle("__________", for: .normal)
        advanceIndex()
        setScore()
        setQuestion()
    }
    
    @IBAction func recordPressed(_ sender: UIButton) {
        recordButton.isEnabled = false
        startRecording()
    }
    
    @IBAction func selectorPressed(_ sender: UIButton) {
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
                        self.scoreVal += 1
                        self.responseTitle.textColor = UIColor.green
                        self.responseTitle.text = "정답입니다!"
                        self.responseBody.text = q.kor
                        /*
                                        in the case where the score limit is reached, I still want the user
                                        to briefly see that he/she has reached that limit before resetting to 0
                                       */
                        self.setScore()
                        self.playSuccessSound()
                        DispatchQueue.main.asyncAfter(deadline: .now() + q.delay) {
                            self.advanceQuestion()
                        }
                    } else {
                        self.responseTitle.textColor = UIColor.red
                        self.responseTitle.text = "응답이 올바르지 않습니다~"
                        self.responseBody.text = "Please try again!"
                        self.playFailureSound()
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

