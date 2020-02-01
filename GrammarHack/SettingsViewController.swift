//
//  SettingsViewController.swift
//  GrammarHack
//
//  Created by Joseph Sungpil Choi on 2020/01/30.
//  Copyright © 2020 Paw Kitchen. All rights reserved.
//

import UIKit
import CoreData

class SettingsViewController: UIViewController {
    
    @IBOutlet var labelPronunciation: UILabel!
    @IBOutlet var labelTongueTwister: UILabel!
    @IBOutlet var buttonSave: UIButton!
    
    @IBOutlet var switchWithOnAbout: UISwitch!
    @IBOutlet var switchAtInOn: UISwitch!
    @IBOutlet var switchAdjAdvType: UISwitch!
    @IBOutlet var switchAdjAdvVal: UISwitch!
    @IBOutlet var switchFutureGoingTo: UISwitch!
    @IBOutlet var switchToeicGrammar: UISwitch!
    @IBOutlet var switchMathFractions: UISwitch!
    @IBOutlet var switchAdvFreq: UISwitch!
    @IBOutlet var switchAdjComp: UISwitch!
    @IBOutlet var switchWordPos: UISwitch!
    @IBOutlet var switchPronunciation: UISwitch!
    @IBOutlet var switchTongueTwisters: UISwitch!
    @IBOutlet var sliderTimePronunciation: UISlider!
    @IBOutlet var sliderTimeTongueTwisters: UISlider!
    
    var currentSetting: NSManagedObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonSave.layer.cornerRadius = 8
        guard let nsObj = getSettings() else {
            return
        }
        currentSetting = nsObj
        if let withOnAbout = currentSetting?.value(forKey: "withOnAbout") as? Bool {
            switchWithOnAbout.isOn = withOnAbout
        }
        if let atInOn = currentSetting?.value(forKey: "atInOn") as? Bool {
            switchAtInOn.isOn = atInOn
        }
        if let adjAdvType = currentSetting?.value(forKey: "adjAdvType") as? Bool {
            switchAdjAdvType.isOn = adjAdvType
        }
        if let adjAdvVal = currentSetting?.value(forKey: "adjAdvVal") as? Bool {
            switchAdjAdvVal.isOn = adjAdvVal
        }
        if let futureGoingTo = currentSetting?.value(forKey: "futureGoingTo") as? Bool {
            switchFutureGoingTo.isOn = futureGoingTo
        }
        if let toeicGrammar = currentSetting?.value(forKey: "toeicGrammar") as? Bool {
            switchToeicGrammar.isOn = toeicGrammar
        }
        if let mathFractions = currentSetting?.value(forKey: "mathFractions") as? Bool {
            switchMathFractions.isOn = mathFractions
        }
        if let advFreq = currentSetting?.value(forKey: "advFreq") as? Bool {
            switchAdvFreq.isOn = advFreq
        }
        if let adjComp = currentSetting?.value(forKey: "adjComp") as? Bool {
            switchAdjComp.isOn = adjComp
        }
        if let wordPos = currentSetting?.value(forKey: "wordPos") as? Bool {
            switchWordPos.isOn = wordPos
        }
        if let pronunciation = currentSetting?.value(forKey: "pronunciation") as? Bool {
            switchPronunciation.isOn = pronunciation
        }
        if let tongueTwisters = currentSetting?.value(forKey: "tongueTwisters") as? Bool {
            switchTongueTwisters.isOn = tongueTwisters
        }
        if let timePronunciation = currentSetting?.value(forKey: "timePronunciation") as? Int8 {
            labelPronunciation.text = "말하기 연습 시간 제한 (\(timePronunciation)초)"
            sliderTimePronunciation.value = Float(timePronunciation)
        }
        if let timeTongueTwisters = currentSetting?.value(forKey: "timeTongueTwisters") as? Int8 {
            labelTongueTwister.text = "발음하기 힘든 어구 시간 제한 (\(timeTongueTwisters)초)"
            sliderTimeTongueTwisters.value = Float(timeTongueTwisters)
        }
    }
    
    
    func resetAllRecords() -> Bool {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return false
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Settings")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
        do {
            try managedContext.execute(deleteRequest)
            try managedContext.save()
            return true
        } catch {
            print ("There was an error")
            return false
        }
    }
    
    
    @IBAction func handleSliderChange(_ sender: UISlider) {
        let val = Int(sender.value)
        switch sender.tag {
        case 1:
            labelPronunciation.text = "말하기 연습 시간 제한 (\(val)초)"
        case 2:
            labelTongueTwister.text = "발음하기 힘든 어구 시간 제한 (\(val)초)"
        default:
            print("Unidentified tag")
        }
    }
    
    @IBAction func handleSavePress(_ sender: UIButton) {
        if !resetAllRecords() {
            return
        }
        let s = Setting(
            withOnAbout: switchWithOnAbout.isOn,
            atInOn: switchAtInOn.isOn,
            adjAdvType: switchAdjAdvType.isOn,
            adjAdvVal: switchAdjAdvVal.isOn,
            futureGoingTo: switchFutureGoingTo.isOn,
            toeicGrammar: switchToeicGrammar.isOn,
            mathFractions: switchMathFractions.isOn,
            advFreq: switchAdvFreq.isOn,
            adjComp: switchAdjComp.isOn,
            wordPos: switchWordPos.isOn,
            pronunciation: switchPronunciation.isOn,
            tongueTwisters: switchTongueTwisters.isOn
        )
        
        if let timePronunciation = sliderTimePronunciation?.value {
            s.timePronunciation = Int(timePronunciation)
        }
        
        if let timeTongueTwisters = sliderTimeTongueTwisters?.value {
            s.timeTongueTwisters = Int(timeTongueTwisters)
        }
        
        guard let nsObj = saveSettings(s) else {
            return
        }
        currentSetting = nsObj
        if let presenter = presentingViewController as? ViewController {
            presenter.quiz.applyFilters()
            presenter.responseTitle.text = ""
            presenter.responseBody.text = ""
            presenter.setQuestion()
        }
        dismiss(animated: true, completion: nil)
    }
}

