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
    var speechEnabled: Bool = false
    var transcript: String = ""
    let audioEngine = AVAudioEngine()
    let speechRecognizer = SFSpeechRecognizer()
    let request = SFSpeechAudioBufferRecognitionRequest()
    var recognitionTask: SFSpeechRecognitionTask?
    var scoreVal: Int = 0
    var readAnswer: String = ""
    var readDelay: Double = 5
    var readCount: Int = 0
    let readLimit: Int = 3
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
        
        exerciseSubtitle.numberOfLines = 0
        phraseStart.numberOfLines = 0
        phraseEnd.numberOfLines = 0
        responseTitle.numberOfLines = 0
        responseBody.numberOfLines = 0
        recordButton.layer.cornerRadius = 8
        
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
                        self.readCount = 0
                        playSuccessSound()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            self.advanceQuestion()
                        }
                    }
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + self.readDelay) {
                if matched {
                    return
                }
                self.stopRecording()
                self.readCount += 1
                self.responseTitle.textColor = UIColor.red
                self.responseTitle.text = "올바르지 않습니다 (\(self.readLimit - self.readCount)번의 시도 남음)"
                playFailureSound()
                
                if self.readCount >= 3 {
                    self.readCount = 0
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        self.advanceQuestion()
                    }
                } else {
                    self.recordButton.isEnabled = true
                    self.recordButton.setTitle("🎤 목소리 녹음하기", for: .normal)
                    self.recordButton.backgroundColor = .systemBlue
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
    }
    
    func skip() {
        self.stopRecording()
    }
    
    func setQuestion() {
        let q = Quest.current
        if q.category == "reading" || q.category == "reading-tonguetwister" {
            responseTitle.text = ""
            responseBody.text = ""
            exerciseTitle.text = q.title
            exerciseSubtitle.text = q.subtitle
            phraseStart.text = q.answer
            phraseEnd.text = q.kor
            readAnswer = normalize(text: q.answer)
            readDelay = q.category == "reading" ? 5 : 8
            recordButton.isEnabled = true
            recordButton.setTitle("🎤 목소리 녹음하기", for: .normal)
            recordButton.backgroundColor = .systemBlue
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
        recordButton.setTitle("🎤 녹음 중...", for: .normal)
        recordButton.backgroundColor = .orange
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
        guard let opts = Quest.current.options else {
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
                    self.optionButton.setTitle(opt, for: .normal)
                    let q = Quest.current
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
                        playSuccessSound()
                        DispatchQueue.main.asyncAfter(deadline: .now() + q.delay) {
                            self.advanceQuestion()
                        }
                    } else {
                        self.responseTitle.textColor = UIColor.red
                        self.responseTitle.text = "응답이 올바르지 않습니다~"
                        self.responseBody.text = "Please try again!"
                        playFailureSound()
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

