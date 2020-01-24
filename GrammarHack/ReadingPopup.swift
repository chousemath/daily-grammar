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
    let audioEngine = AVAudioEngine()
    let speechRecognizer = SFSpeechRecognizer()
    let request = SFSpeechAudioBufferRecognitionRequest()
    var recognitionTask: SFSpeechRecognitionTask?
    
    
    fileprivate let labelTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    fileprivate let labelContent: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()
    
    fileprivate let labelTranscript: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()
    
    @objc fileprivate func startRecording() {
        do {
            let node = audioEngine.inputNode
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
                    self.transcript = transcription.formattedString
                }
            }
            
        } catch let error {
            print("There was problem recording \(error.localizedDescription)")
        }
        
        //        guard let successHandler = handleSuccess else {
        //            return
        //        }
        //        successHandler(true)
        //        animateOut()
    }
    
    @objc fileprivate func stopRecording() {
        audioEngine.stop()
        request.endAudio()
        recognitionTask?.cancel()
    }
    
    
    fileprivate let btnRecord: UIButton = {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        btn.setTitleColor(.systemBlue, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("내 목소리를 녹음하기", for: .normal)
        btn.addTarget(self, action: #selector(startRecording), for: .touchUpInside)
        return btn
    }()
    
    fileprivate let btnStop: UIButton = {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        btn.setTitleColor(.systemBlue, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Stop", for: .normal)
        btn.addTarget(self, action: #selector(stopRecording), for: .touchUpInside)
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
            labelContent,
            labelTranscript,
            btnRecord,
            btnStop
        ])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 8
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
    
    func setValues(title: String, content: String, onSuccess: @escaping (Bool) -> ()) {
        labelTitle.text = title
        labelContent.text = content
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
        stack.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: 0.25).isActive = true
        
        animateIn()
        
        SFSpeechRecognizer.requestAuthorization{ (authStatus) in
            switch authStatus {
            case .authorized:
                self.speechEnabled = true
                print("speech authorized")
            case .denied:
                self.speechEnabled = false
                print("speech denied")
            case .restricted:
                self.speechEnabled = false
                print("speech restricted")
            case .notDetermined:
                self.speechEnabled = false
                print("speech not yet auth")
            @unknown default:
                print("speech error")
                return
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
}
