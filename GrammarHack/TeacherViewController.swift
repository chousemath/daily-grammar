//
//  TeacherViewController.swift
//  GrammarHack
//
//  Created by Joseph Sungpil Choi on 2020/01/31.
//  Copyright © 2020 Paw Kitchen. All rights reserved.
//


import UIKit
import CoreData

class TeacherViewController: UIViewController {
    
    var currentSetting: NSManagedObject?
    
    @IBOutlet var labelName: UITextField!
    @IBOutlet var labelTeacherEmail: UITextField!
    @IBOutlet var switchSendToTeacher: UISwitch!
    @IBOutlet var btnSave: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnSave.layer.cornerRadius = 8
        guard let nsObj = getSettings() else {
            return
        }
        currentSetting = nsObj
        if let name = currentSetting?.value(forKey: "name") as? String {
            labelName.text = name
        }
        if let teacherEmail = currentSetting?.value(forKey: "teacherEmail") as? String {
            labelTeacherEmail.text = teacherEmail
        }
        if let sendToTeacher = currentSetting?.value(forKey: "sendToTeacher") as? Bool {
            switchSendToTeacher.isOn = sendToTeacher
        }
    }
    
    @IBAction func handleSavePress(_ sender: UIButton) {
        guard let withOnAbout = currentSetting?.value(forKey: "withOnAbout") as? Bool else {
            return
        }
        guard let atInOn = currentSetting?.value(forKey: "atInOn") as? Bool else {
            return
        }
        guard let adjAdvType = currentSetting?.value(forKey: "adjAdvType") as? Bool else {
            return
        }
        guard let adjAdvVal = currentSetting?.value(forKey: "adjAdvVal") as? Bool else {
            return
        }
        guard let futureGoingTo = currentSetting?.value(forKey: "futureGoingTo") as? Bool else {
            return
        }
        guard let toeicGrammar = currentSetting?.value(forKey: "toeicGrammar") as? Bool else {
            return
        }
        guard let mathFractions = currentSetting?.value(forKey: "mathFractions") as? Bool else {
            return
        }
        guard let advFreq = currentSetting?.value(forKey: "advFreq") as? Bool else {
            return
        }
        guard let adjComp = currentSetting?.value(forKey: "adjComp") as? Bool else {
            return
        }
        guard let wordPos = currentSetting?.value(forKey: "wordPos") as? Bool else {
            return
        }
        guard let pronunciation = currentSetting?.value(forKey: "pronunciation") as? Bool else {
            return
        }
        guard let tongueTwisters = currentSetting?.value(forKey: "tongueTwisters") as? Bool else {
            return
        }
        guard let timePronunciation = currentSetting?.value(forKey: "timePronunciation") as? Int else {
            return
        }
        guard let timeTongueTwisters = currentSetting?.value(forKey: "timeTongueTwisters") as? Int else {
            return
        }
        if !resetAllRecords("Settings") {
            return
        }
        let s = Setting(
            withOnAbout: withOnAbout,
            atInOn: atInOn,
            adjAdvType: adjAdvType,
            adjAdvVal: adjAdvVal,
            futureGoingTo: futureGoingTo,
            toeicGrammar: toeicGrammar,
            mathFractions: mathFractions,
            advFreq: advFreq,
            adjComp: adjComp,
            wordPos: wordPos,
            pronunciation: pronunciation,
            tongueTwisters: tongueTwisters,
            sendToTeacher: switchSendToTeacher.isOn,
            timePronunciation: timePronunciation,
            timeTongueTwisters: timeTongueTwisters
        )
        if let name = labelName.text {
            s.name = name.trimmingCharacters(in: .whitespacesAndNewlines)
        } else {
            s.name = ""
        }
        
        if let teacherEmail = labelTeacherEmail.text {
            s.teacherEmail = teacherEmail.trimmingCharacters(in: .whitespacesAndNewlines)
        } else {
            s.teacherEmail = ""
        }
        
        guard let nsObj = saveSettings(s) else {
            return
        }
        currentSetting = nsObj
        dismiss(animated: true, completion: nil)
    }
}

