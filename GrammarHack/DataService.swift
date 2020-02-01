//
//  DataService.swift
//  GrammarHack
//
//  Created by Joseph Sungpil Choi on 2020/02/01.
//  Copyright © 2020 Paw Kitchen. All rights reserved.
//
import UIKit
import CoreData

class Setting {
    var withOnAbout: Bool
    var atInOn: Bool
    var adjAdvType: Bool
    var adjAdvVal: Bool
    var futureGoingTo: Bool
    var toeicGrammar: Bool
    var mathFractions: Bool
    var advFreq: Bool
    var adjComp: Bool
    var wordPos: Bool
    var pronunciation: Bool
    var tongueTwisters: Bool
    var timePronunciation: Int
    var timeTongueTwisters: Int
    
    init(
        withOnAbout: Bool = true,
        atInOn: Bool = true,
        adjAdvType: Bool = true,
        adjAdvVal: Bool = true,
        futureGoingTo: Bool = true,
        toeicGrammar: Bool = true,
        mathFractions: Bool = true,
        advFreq: Bool = true,
        adjComp: Bool = true,
        wordPos: Bool = true,
        pronunciation: Bool = true,
        tongueTwisters: Bool = true,
        timePronunciation: Int = 8,
        timeTongueTwisters: Int = 10
    ) {
        self.withOnAbout = withOnAbout
        self.atInOn = atInOn
        self.adjAdvType = adjAdvType
        self.adjAdvVal = adjAdvVal
        self.futureGoingTo = futureGoingTo
        self.toeicGrammar = toeicGrammar
        self.mathFractions = mathFractions
        self.advFreq = advFreq
        self.adjComp = adjComp
        self.wordPos = wordPos
        self.pronunciation = pronunciation
        self.tongueTwisters = tongueTwisters
        self.timePronunciation = timePronunciation
        self.timeTongueTwisters = timeTongueTwisters
    }
}

func getSettings() -> NSManagedObject? {
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
        return nil
    }
    var settings: [NSManagedObject] = []
    let managedContext = appDelegate.persistentContainer.viewContext
    let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Settings")
    do {
        settings = try managedContext.fetch(fetchRequest)
        if settings.count == 0 {
            let s = Setting()
            guard let nsObj = saveSettings(s) else {
                return nil
            }
            return nsObj
        } else {
            return settings[0]
        }
    } catch let error as NSError {
        print("Could not fetch. \(error), \(error.userInfo)")
        return nil
    }
}

func saveSettings(_ setting: Setting) -> NSManagedObject? {
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
        return nil
    }
    let managedContext = appDelegate.persistentContainer.viewContext
    let entity = NSEntityDescription.entity(forEntityName: "Settings", in: managedContext)!
    let s = NSManagedObject(entity: entity, insertInto: managedContext)
    s.setValue(setting.withOnAbout, forKeyPath: "withOnAbout")
    s.setValue(setting.atInOn, forKeyPath: "atInOn")
    s.setValue(setting.adjAdvType, forKeyPath: "adjAdvType")
    s.setValue(setting.adjAdvVal, forKeyPath: "adjAdvVal")
    s.setValue(setting.futureGoingTo, forKeyPath: "futureGoingTo")
    s.setValue(setting.toeicGrammar, forKeyPath: "toeicGrammar")
    s.setValue(setting.mathFractions, forKeyPath: "mathFractions")
    s.setValue(setting.advFreq, forKeyPath: "advFreq")
    s.setValue(setting.adjComp, forKeyPath: "adjComp")
    s.setValue(setting.wordPos, forKeyPath: "wordPos")
    s.setValue(setting.pronunciation, forKeyPath: "pronunciation")
    s.setValue(setting.tongueTwisters, forKeyPath: "tongueTwisters")
    s.setValue(setting.timePronunciation, forKeyPath: "timePronunciation")
    s.setValue(setting.timeTongueTwisters, forKeyPath: "timeTongueTwisters")
    do {
        try managedContext.save()
        return s
    } catch let error as NSError {
        print("Could not save. \(error), \(error.userInfo)")
        return nil
    }
}
