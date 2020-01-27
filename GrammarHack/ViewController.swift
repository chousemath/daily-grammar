//
//  ViewController.swift
//  GrammarHack
//
//  Created by Joseph Sungpil Choi on 2020/01/19.
//  Copyright © 2020 Paw Kitchen. All rights reserved.
//

import UIKit
import Speech

class ViewController: UIViewController {
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default) //UIImage.init(named: "transparent.png")
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
        return String(text.filter {okayChars.contains($0) }).lowercased()
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
            self.recordButton.setTitle("🎤 목소리 녹음하기", for: .normal)
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
            exerciseTitle.text = q.title
            exerciseSubtitle.text = q.subtitle
            phraseStart.text = q.answer
            phraseEnd.text = q.kor
            readAnswer = normalize(text: q.answer)
            quiz.setDelayReadByCat(q.category)
            recordButton.isEnabled = true
            recordButton.setTitle("🎤 목소리 녹음하기", for: .normal)
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
        exerciseTitle.text = q.title
        exerciseSubtitle.text = q.subtitle
        phraseStart.text = q.phraseStart
        phraseEnd.text = q.phraseEnd
    }
    
    func setScore() {
        if quiz.score >= quiz.limitScore {
            playSound(fileName: "cheer01")
            guard let vc = sboard.instantiateViewController(withIdentifier: "QuizSuccess") as? QuizSuccess else {
                return
            }
            present(vc, animated: true, completion: nil)
            vc.labelAcc.text = "\(quiz.score)/\(quiz.attempts)"
            quiz.scoreReset()
            quiz.attemptsReset()
        }
        score.text = "\(quiz.score)/\(quiz.limitScore)"
    }
    
    @objc func advanceQuestion() -> () {
        optionButton.setTitle("__________", for: .normal)
        quiz.next()
        setScore()
        setQuestion()
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
            title: "가능한 답변입니다",
            message: "아래 답변 중 하나를 선택하세요",
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
                        self.responseTitle.textColor = UIColor.red
                        self.responseTitle.text = "응답이 올바르지 않습니다~"
                        self.responseBody.text = "Please try again!"
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

