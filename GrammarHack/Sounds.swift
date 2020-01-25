//
//  Sounds.swift
//  GrammarHack
//
//  Created by Joseph Sungpil Choi on 2020/01/25.
//  Copyright © 2020 Paw Kitchen. All rights reserved.
//

import AVFoundation

var player: AVAudioPlayer?

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
