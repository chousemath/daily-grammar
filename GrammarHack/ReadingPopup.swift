//
//  ReadingPopup.swift
//  GrammarHack
//
//  Created by Joseph Sungpil Choi on 2020/01/24.
//  Copyright © 2020 Paw Kitchen. All rights reserved.
//

import UIKit
import Speech

class ReadingPopup: UIView {
    fileprivate var handleSuccess: ((Bool) -> ())? = nil
    fileprivate var speechEnabled: Bool = false
    fileprivate var transcript: String = ""
    fileprivate var answer: String = "xyz"
    fileprivate var count: Int = 0
    let audioEngine = AVAudioEngine()
    let speechRecognizer = SFSpeechRecognizer()
    let request = SFSpeechAudioBufferRecognitionRequest()
    var recognitionTask: SFSpeechRecognitionTask?
    
    fileprivate func normalize(text: String) -> String {
        let okayChars : Set<Character> =
            Set("abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLKMNOPQRSTUVWXYZ1234567890")
        return String(text.filter {okayChars.contains($0) }).lowercased()
    }
    
    fileprivate let labelTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.text = "영어 발음 연습"
        return label
    }()
    
    fileprivate let labelContent: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 28)
        label.numberOfLines = 0
        return label
    }()
    
    fileprivate let labelKor: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 28)
        label.numberOfLines = 0
        return label
    }()
    
    fileprivate let labelTranscript: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 28)
        label.numberOfLines = 0
        return label
    }()
    
    @objc fileprivate func startRecording() {
        disableBtn()
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
            recognitionTask = speechRecognizer?.recognitionTask(with: request) {
                [unowned self]
                (result, _) in
                if let transcription = result?.bestTranscription {
                    self.labelTranscript.text = transcription.formattedString
                    self.transcript = self.normalize(text: transcription.formattedString)
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                self.stopRecording()
                guard let successHandler = self.handleSuccess else {
                    return
                }
                if self.transcript == self.answer {
                    successHandler(false)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        self.animateOut()
                    }
                } else {
                    self.count += 1
                    if self.count >= 3 {
                        successHandler(true)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            self.animateOut()
                        }
                    } else {
                        self.enableBtn()
                    }
                }
            }
            
        } catch let error {
            print("There was problem recording \(error.localizedDescription)")
        }
    }
    
    fileprivate func stopRecording() {
        audioEngine.stop()
        request.endAudio()
        recognitionTask?.cancel()
        enableBtn()
        print("Recording stopped")
    }
    
    fileprivate func enableBtn() {
        self.btnRecord.isEnabled = true
        self.btnRecord.setTitle("내 목소리를 녹음하기", for: .normal)
        self.btnRecord.setTitleColor(.systemBlue, for: .normal)
    }
    
    fileprivate func disableBtn() {
        self.btnRecord.isEnabled = false
        self.btnRecord.setTitle("목소리를 녹음하고 있습니다...", for: .normal)
        self.btnRecord.setTitleColor(.systemGray, for: .normal)
    }
    
    fileprivate let btnRecord: UIButton = {
        let btn = UIButton()
        btn.setTitleColor(.systemBlue, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("내 목소리를 녹음하기", for: .normal)
        btn.addTarget(self, action: #selector(startRecording), for: .touchUpInside)
        return btn
    }()
    
    @objc fileprivate func skip() {
        self.stopRecording()
        guard let successHandler = self.handleSuccess else {
            return
        }
        successHandler(true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.animateOut()
        }
    }
    
    fileprivate let btnSkip: UIButton = {
        let btn = UIButton()
        btn.setTitleColor(.systemBlue, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("건너뛰기", for: .normal)
        btn.addTarget(self, action: #selector(skip), for: .touchUpInside)
        return btn
    }()
    
    fileprivate let container: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        v.layer.cornerRadius = 24
        return v
    }()
    
    fileprivate lazy var stack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            labelTitle,
            btnRecord,
            btnSkip,
            labelContent,
            labelKor,
            labelTranscript,
        ])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 8
        labelTitle.heightAnchor.constraint(equalToConstant: 50).isActive = true
        labelTitle.topAnchor.constraint(equalTo: stack.topAnchor, constant: 24).isActive = true
        labelTitle.leadingAnchor.constraint(equalTo: stack.leadingAnchor, constant: 24).isActive = true
        
        btnRecord.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 24).isActive = true
        btnRecord.leadingAnchor.constraint(equalTo: stack.leadingAnchor, constant: 24).isActive = true
        btnRecord.trailingAnchor.constraint(equalTo: stack.trailingAnchor, constant: -24).isActive = true
        btnRecord.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        btnSkip.topAnchor.constraint(equalTo: btnRecord.bottomAnchor, constant: 24).isActive = true
        btnSkip.leadingAnchor.constraint(equalTo: stack.leadingAnchor, constant: 24).isActive = true
        btnSkip.trailingAnchor.constraint(equalTo: stack.trailingAnchor, constant: -24).isActive = true
        btnSkip.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        labelContent.heightAnchor.constraint(equalToConstant: 120).isActive = true
        labelContent.topAnchor.constraint(equalTo: btnSkip.bottomAnchor, constant: 24).isActive = true
        labelContent.leadingAnchor.constraint(equalTo: stack.leadingAnchor, constant: 24).isActive = true
        
        labelKor.heightAnchor.constraint(equalToConstant: 120).isActive = true
        labelKor.topAnchor.constraint(equalTo: labelContent.bottomAnchor, constant: 24).isActive = true
        labelKor.leadingAnchor.constraint(equalTo: stack.leadingAnchor, constant: 24).isActive = true
        
        labelTranscript.heightAnchor.constraint(equalToConstant: 120).isActive = true
        labelTranscript.topAnchor.constraint(equalTo: labelKor.bottomAnchor, constant: 24).isActive = true
        //        labelTranscript.bottomAnchor.constraint(equalTo: stack.bottomAnchor, constant: 24).isActive = true
        labelTranscript.leadingAnchor.constraint(equalTo: stack.leadingAnchor, constant: 24).isActive = true
        labelTranscript.trailingAnchor.constraint(equalTo: stack.trailingAnchor, constant: -24).isActive = true
        //        labelTranscript.heightAnchor.constraint(equalToConstant: 200).isActive = true
        //        labelTranscript.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        
        
        return stack
    }()
    
    @objc fileprivate func animateOut() {
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            usingSpringWithDamping: 0.7,
            initialSpringVelocity: 1,
            options: .curveEaseIn,
            animations: { self.container.transform = CGAffineTransform(translationX: 0, y: -self.frame.height)}
        ) { (complete) in
            if complete {
                self.removeFromSuperview()
            }
        }
    }
    
    @objc fileprivate func animateIn() {
        self.container.transform = CGAffineTransform(translationX: 0, y: -self.frame.height)
        self.alpha = 0
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            usingSpringWithDamping: 0.7,
            initialSpringVelocity: 1,
            options: .curveEaseIn,
            animations: {
                self.container.transform = .identity
                self.alpha = 1
        }
        )
    }
    
    func setValues(content: String, kor: String, onSuccess: @escaping (Bool) -> ()) {
        labelContent.text = content
        labelKor.text = kor
        answer = normalize(text: content)
        handleSuccess = onSuccess
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .gray
        self.frame = UIScreen.main.bounds
        self.addSubview(container)
        
        container.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        container.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        container.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9).isActive = true
        container.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.9).isActive = true
        
        container.addSubview(stack)
        
        stack.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
        stack.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
        //        stack.centerYAnchor.constraint(equalTo: container.centerYAnchor).isActive = true
        stack.leadingAnchor.constraint(equalTo: container.leadingAnchor).isActive = true
        stack.trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
        stack.widthAnchor.constraint(equalTo: container.widthAnchor).isActive = true
        stack.heightAnchor.constraint(equalTo: container.heightAnchor).isActive = true
        
        animateIn()
        
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
    
    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
}
