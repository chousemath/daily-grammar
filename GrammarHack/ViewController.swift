//
//  ViewController.swift
//  GrammarHack
//
//  Created by Joseph Sungpil Choi on 2020/01/19.
//  Copyright © 2020 Paw Kitchen. All rights reserved.
//

import UIKit
import Speech
import SendGrid

class ViewController: UIViewController {
    let timestampStart = Date.currentTimestamp
    let sboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    var speechEnabled: Bool = false
    var transcript: String = ""
    let audioEngine = AVAudioEngine()
    let speechRecognizer = SFSpeechRecognizer()
    let request = SFSpeechAudioBufferRecognitionRequest()
    var recognitionTask: SFSpeechRecognitionTask?
    var readAnswer: String = ""
    var readCount: Int = 0
    var timer: Timer = Timer()
    
    var quiz = Quiz()
    
    @IBOutlet var exerciseTitle: UILabel!
    @IBOutlet var exerciseSubtitle: UILabel!
    @IBOutlet var phraseStart: UILabel!
    @IBOutlet var phraseEnd: UILabel!
    @IBOutlet var optionButton: UIButton!
    @IBOutlet var responseTitle: UILabel!
    @IBOutlet var responseBody: UILabel!
    @IBOutlet var score: UILabel!
    @IBOutlet var recordButton: UIButton!
    @IBOutlet var progressRead: UIProgressView!
    
    let encouragementImages = [
        UIImage(named: "peng-glass.jpg"),
        UIImage(named: "peng-guitar.jpg"),
        UIImage(named: "peng-korean.jpg"),
        UIImage(named: "peng-love.jpg"),
        UIImage(named: "peng-good-job.jpg")
    ]
    
    let nums = ["0":"zero","1":"one","2":"two","3":"three","4":"four","5":"five","6":"six","7":"seven","8":"eight","9":"nine","10":"ten","11":"eleven","12":"twelve","13":"thirteen","14":"fourteen","15":"fifteen","16":"sixteen","17":"seventeen","18":"eighteen","19":"nineteen","20":"twenty","21":"twenty-one","22":"twenty-two","23":"twenty-three","24":"twenty-four","25":"twenty-five","26":"twenty-six","27":"twenty-seven","28":"twenty-eight","29":"twenty-nine","30":"thirty","31":"thirty-one","32":"thirty-two","33":"thirty-three","34":"thirty-four","35":"thirty-five","36":"thirty-six","37":"thirty-seven","38":"thirty-eight","39":"thirty-nine","40":"forty","41":"forty-one","42":"forty-two","43":"forty-three","44":"forty-four","45":"forty-five","46":"forty-six","47":"forty-seven","48":"forty-eight","49":"forty-nine","50":"fifty","51":"fifty-one","52":"fifty-two","53":"fifty-three","54":"fifty-four","55":"fifty-five","56":"fifty-six","57":"fifty-seven","58":"fifty-eight","59":"fifty-nine","60":"sixty","61":"sixty-one","62":"sixty-two","63":"sixty-three","64":"sixty-four","65":"sixty-five","66":"sixty-six","67":"sixty-seven","68":"sixty-eight","69":"sixty-nine","70":"seventy","71":"seventy-one","72":"seventy-two","73":"seventy-three","74":"seventy-four","75":"seventy-five","76":"seventy-six","77":"seventy-seven","78":"seventy-eight","79":"seventy-nine","80":"eighty","81":"eighty-one","82":"eighty-two","83":"eighty-three","84":"eighty-four","85":"eighty-five","86":"eighty-six","87":"eighty-seven","88":"eighty-eight","89":"eighty-nine","90":"ninety","91":"ninety-one","92":"ninety-two","93":"ninety-three","94":"ninety-four","95":"ninety-five","96":"ninety-six","97":"ninety-seven","98":"ninety-eight","99":"ninety-nine","100":"one hundred", "OK": "okay", "ok": "okay", "Ok": "okay"
    ]
    
    func numReplace(_ input: String) -> String {
        var arr = input.components(separatedBy: " ")
        for (i, word) in arr.enumerated() {
            if let val = nums[word] {
                arr[i] = val
            }
        }
        return arr.joined(separator: " ")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        
        exerciseSubtitle.numberOfLines = 0
        phraseStart.numberOfLines = 0
        phraseEnd.numberOfLines = 0
        responseTitle.numberOfLines = 0
        responseBody.numberOfLines = 0
        recordButton.layer.cornerRadius = 8
        
        responseTitle.text = ""
        responseBody.text = ""
        
        // pick a random question to begin with
        quiz.applyFilters()
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
            Set("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ1234567890")
        return String(numReplace(text).filter {okayChars.contains($0) }).lowercased()
    }
    
    @objc func handleReadDelay() {
        let delay = Float(self.quiz.delayRead)
        if self.quiz.timeRead < delay {
            self.quiz.timeReadInc()
            progressRead.progress = self.quiz.timeRead / delay
            return
        }
        self.timer.invalidate()
        progressRead.progress = 0
        self.quiz.timeReadReset()
        self.quiz.streakReset()
        self.quiz.appendWrongQuest()
        self.stopRecording()
        self.readCount += 1
        self.responseTitle.textColor = UIColor.red
        self.responseTitle.text = "올바르지 않습니다 (\(self.quiz.limitRead - self.readCount)번의 시도 남음)"
        playFailureSound()
        
        if self.readCount >= 3 {
            self.readCount = 0
            Timer.scheduledTimer(
                timeInterval: 1.0,
                target: self,
                selector: #selector(self.advanceQuestion),
                userInfo: nil,
                repeats: false
            )
        } else {
            self.recordButton.isEnabled = true
            self.recordButton.setTitle("🎙️ 녹음하기", for: .normal)
            self.recordButton.backgroundColor = .systemBlue
        }
    }
    
    func startRecording() {
        do {
            quiz.attemptsInc()
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
            recognitionTask = speechRecognizer?.recognitionTask(with: request) {
                [unowned self]
                (result, _) in
                if let transcription = result?.bestTranscription {
                    self.responseBody.text = transcription.formattedString
                    self.transcript = self.normalize(text: transcription.formattedString)
                    if self.transcript == self.readAnswer {
                        self.stopRecording()
                        self.timer.invalidate()
                        self.progressRead.progress = 0
                        self.quiz.timeReadReset()
                        self.quiz.scoreInc()
                        self.encourage()
                        self.responseTitle.textColor = UIColor.green
                        self.responseTitle.text = "정답입니다!"
                        self.setScore()
                        self.readCount = 0
                        playSuccessSound()
                        Timer.scheduledTimer(
                            timeInterval: 1.0,
                            target: self,
                            selector: #selector(self.advanceQuestion),
                            userInfo: nil,
                            repeats: false
                        )
                    }
                }
            }
            timer = Timer.scheduledTimer(
                timeInterval: 1.0,
                target: self,
                selector: #selector(self.handleReadDelay),
                userInfo: nil,
                repeats: true
            )
        } catch let error {
            print("There was problem recording \(error.localizedDescription)")
        }
    }
    
    func stopRecording() {
        audioEngine.stop()
        request.endAudio()
        recognitionTask?.cancel()
    }
    
    func skip() {
        self.stopRecording()
    }
    
    func setQuestion() {
        let q = quiz.current
        if q.category == "reading" || q.category == "reading-tonguetwister" {
            responseTitle.text = ""
            responseBody.text = ""
            exerciseTitle.text = "> \(q.title)"
            exerciseSubtitle.text = ">> \(q.subtitle)"
            phraseStart.text = "🎙️ \(q.answer)"
            phraseEnd.text = "🇰🇷 \(q.kor)"
            readAnswer = normalize(text: q.answer)
            recordButton.isEnabled = true
            recordButton.setTitle("🎙️ 녹음하기", for: .normal)
            recordButton.backgroundColor = .systemBlue
            recordButton.isHidden = false
            optionButton.isHidden = true
            progressRead.isHidden = false
            return
        }
        optionButton.isHidden = false
        progressRead.isHidden = true
        recordButton.isHidden = true
        responseTitle.text = ""
        responseBody.text = ""
        exerciseTitle.text = "> \(q.title)"
        exerciseSubtitle.text = ">> \(q.subtitle)"
        phraseStart.text = q.phraseStart
        phraseEnd.text = q.phraseEnd
    }
    
    func navigateTo(pageName: String, pageURL: String?) {
        if let pURL = pageURL {
            guard let vc = sboard.instantiateViewController(withIdentifier: pageName) as? WebViewController else {
                return
            }
            present(vc, animated: true, completion: nil)
            vc.loadPage(pURL)
        } else {
            let vc = sboard.instantiateViewController(withIdentifier: pageName)
            present(vc, animated: true, completion: nil)
        }
    }
    
    let streakMilestones = [5, 10, 15]
    func encourage() {
        if !streakMilestones.contains(quiz.streak) {
            return
        }
        guard let vc = sboard.instantiateViewController(withIdentifier: "EncouragementViewController") as? EncouragementViewController else {
            return
        }
        present(vc, animated: true, completion: nil)
        if let bg = encouragementImages.randomElement() {
            vc.bgImage.image = bg
        }
        vc.messageLabel.text = "\(quiz.streak) in a row!"
    }
    
    func setScore() {
        if quiz.score >= quiz.limitScore {
            guard let vc = sboard.instantiateViewController(withIdentifier: "QuizSuccess") as? QuizSuccess else {
                return
            }
            present(vc, animated: true, completion: nil)
            let score = quiz.score
            let attempts = quiz.attempts
            let textWrong = quiz.questsWrongText
            let htmlWrong = quiz.questsWrongHtml
            print("Score: \(score)")
            print("Attempts: \(attempts)")
            _ = saveResult(QuizResult(
                attempts: attempts,
                score: score,
                timestampStart: timestampStart
            ))
            vc.labelAcc.text = "\(score)/\(attempts)"
            
            quiz.scoreReset()
            quiz.streakReset()
            quiz.attemptsReset()
            quiz.questsWrongReset()
            
            guard let settings = getSettings() else {
                return
            }
            if let sendToTeacher = settings.value(forKey: "sendToTeacher") as? Bool {
                if !sendToTeacher {
                    return
                }
            } else {
                return
            }
            guard let email = settings.value(forKey: "teacherEmail") as? String else {
                return
            }
            
            var studentName = ""
            if let name = settings.value(forKey: "name") as? String {
                studentName = name
            } else if let uuid = UIDevice.current.identifierForVendor {
                studentName = "Student-\(uuid.uuidString)"
            } else {
                studentName = "Unnamed Student"
            }
            let session = Session()
            session.authentication = Authentication.apiKey(SendGridKey)
            let personalization = Personalization(recipients: email)
            let plainText = Content(contentType: ContentType.plainText, value: "Summary\nYour student, \(studentName), has just completed a quiz with a score of \(score) correct answers out of a total of \(attempts) attempts.\(textWrong)")
            let htmlText = Content(contentType: ContentType.htmlText, value: "<h1>Summary</h1><p>Your student, <b>\(studentName)</b>, has just completed a quiz with a score of <b>\(score)</b> correct answers out of a total of <b>\(attempts)</b> attempts.</p>\(htmlWrong)")
            let date = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .none
            dateFormatter.locale = Locale.current
            let emailObj = Email(
                personalizations: [personalization],
                from: "jo@paw-kitchen.com",
                content: [plainText, htmlText],
                subject: "DailyGram Quiz Report :: \(studentName) :: \(dateFormatter.string(from: date))"
            )
            do {
                try session.send(request: emailObj)
            } catch {
                print(error)
            }
        }
        score.text = "\(quiz.score)/\(quiz.limitScore)"
    }
    
    @objc func advanceQuestion() -> () {
        optionButton.setTitle("__________", for: .normal)
        quiz.next()
        setScore()
        setQuestion()
    }
    
    struct SettingsOption {
        let title: String
        let pageName: String?
        let url: String?
    }
    let settingsOptions: [SettingsOption] = [
        SettingsOption(title: "질문 설정편집", pageName: "SettingsViewController", url: nil),
        SettingsOption(title: "선생님 설정편집", pageName: "TeacherViewController", url: nil),
        SettingsOption(title: "사용/개인 정보 약관", pageName: "WebViewController", url: "https://chousemath.github.io/GrammarHack-terms"),
        SettingsOption(title: "모바일 앱 정보", pageName: "AppInfoViewController", url: nil),
        SettingsOption(title: "추가 기능 요청하기", pageName: "WebViewController", url: "https://docs.google.com/forms/d/e/1FAIpQLSdTKKpdL_t3M0BOvNFqAxln_QI9WZNOxb2ePFOlvuCtMU7Ikg/viewform?embedded=true"),
        SettingsOption(title: "영어일기 (coming soon!)", pageName: nil, url: nil),
        SettingsOption(title: "이야기를 만들기 (coming soon!)", pageName: nil, url: nil),
        SettingsOption(title: "활동 로그 (coming soon!)", pageName: nil, url: nil),
        SettingsOption(title: "개발자 로그", pageName: "WebViewController", url: "https://www.notion.so/DailyGram-Developer-Notes-225f64d555a14b3fbb7a081bbcc44756"),
    ]
    
    @IBAction func handleSettingsPress(_ sender: UIButton) {
        let aSheet = UIAlertController(
            title: nil,
            message: nil,
            preferredStyle: .actionSheet
        )
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        for opt in settingsOptions {
            aSheet.addAction(UIAlertAction(
                title: opt.title,
                style: .default,
                handler: { action in
                    guard let pname = opt.pageName else {
                        let alert = UIAlertController(title: "진행 중", message: "우리는 여전히 이 기능을 구축하고 있습니다.", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "네, 좋아요", style: .default, handler: nil))
                        self.present(alert, animated: true)
                        return
                    }
                    self.navigateTo(pageName: pname, pageURL: opt.url)
            }
            ))
        }
        aSheet.addAction(cancel)
        present(aSheet, animated: true, completion: nil)
    }
    
    @IBAction func recordPressed(_ sender: UIButton) {
        recordButton.isEnabled = false
        recordButton.setTitle("🎤 녹음 중...", for: .normal)
        recordButton.backgroundColor = .orange
        startRecording()
    }
    
    @objc func clearQuest() {
        responseTitle.text = ""
        responseBody.text = ""
    }
    
    @IBAction func selectorPressed(_ sender: UIButton) {
        let aSheet = UIAlertController(
            title: "문장 완성하기",
            message: "아래의 보기 중 한가지를 선택하세요",
            preferredStyle: .actionSheet
        )
        let cancel = UIAlertAction(
            title: "취소",
            style: .cancel,
            handler: nil
        )
        guard let opts = quiz.current.options else {
            return
        }
        for opt in opts {
            if opt == "" {
                continue
            }
            aSheet.addAction(UIAlertAction(
                title: opt,
                style: .default,
                handler: { action in
                    self.quiz.attemptsInc()
                    self.optionButton.setTitle(opt, for: .normal)
                    let q = self.quiz.current
                    if q.match(answer: opt) {
                        self.quiz.scoreInc()
                        if self.quiz.score != self.quiz.limitScore {
                            self.encourage()
                        }
                        self.responseTitle.textColor = UIColor.green
                        self.responseTitle.text = "정답입니다!"
                        self.responseBody.text = q.kor
                        /*
                                     in the case where the score limit is reached, I still want the user
                                     to briefly see that he/she has reached that limit before resetting to 0
                                   */
                        self.setScore()
                        playSuccessSound()
                        Timer.scheduledTimer(
                            timeInterval: 2.0,
                            target: self,
                            selector: #selector(self.advanceQuestion),
                            userInfo: nil,
                            repeats: false
                        )
                    } else {
                        self.quiz.streakReset()
                        self.quiz.appendWrongQuest()
                        self.responseTitle.textColor = UIColor.red
                        self.responseTitle.text = "정답이 아닙니다"
                        self.responseBody.text = "다시 한번 생각해보세요"
                        playFailureSound()
                        Timer.scheduledTimer(
                            timeInterval: 1.0,
                            target: self,
                            selector: #selector(self.clearQuest),
                            userInfo: nil,
                            repeats: false
                        )
                    }
            }
            ))
        }
        aSheet.addAction(cancel)
        present(aSheet, animated: true, completion: nil)
    }
    
}

