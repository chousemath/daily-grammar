//
//  DataService.swift
//  GrammarHack
//
//  Created by Joseph Sungpil Choi on 2020/02/01.
//  Copyright © 2020 Paw Kitchen. All rights reserved.
//
import UIKit
import CoreData

extension Date {
    static var currentTimestamp: Int64 {
        return Int64(Date().timeIntervalSince1970)
    }
}

class QuizResult {
    var attempts: Int
    var score: Int
    var timestampStart: Int64
    var timestampEnd: Int64
    
    init(
        attempts: Int,
        score: Int,
        timestampStart: Int64
    ) {
        self.attempts = attempts
        self.score = score
        self.timestampStart = timestampStart
        self.timestampEnd = Date.currentTimestamp
    }
}

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
    var sendToTeacher: Bool
    var timePronunciation: Int
    var timeTongueTwisters: Int
    var name: String
    var teacherEmail: String
    
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
        sendToTeacher: Bool = true,
        timePronunciation: Int = 8,
        timeTongueTwisters: Int = 10,
        name: String = "",
        teacherEmail: String = ""
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
        self.sendToTeacher = sendToTeacher
        self.timePronunciation = timePronunciation
        self.timeTongueTwisters = timeTongueTwisters
        self.name = name
        self.teacherEmail = teacherEmail
    }
}

func getResults() -> [NSManagedObject] {
    var results: [NSManagedObject] = []
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
        return results
    }
    let managedContext = appDelegate.persistentContainer.viewContext
    let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "QuizResults")
    do {
        results = try managedContext.fetch(fetchRequest)
        return results
    } catch let error as NSError {
        print("Could not fetch. \(error), \(error.userInfo)")
        return []
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

func saveResult(_ result: QuizResult) -> Bool {
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
        return false
    }
    let managedContext = appDelegate.persistentContainer.viewContext
    let entity = NSEntityDescription.entity(forEntityName: "QuizResults", in: managedContext)!
    let s = NSManagedObject(entity: entity, insertInto: managedContext)
    s.setValue(result.attempts, forKeyPath: "attempts")
    s.setValue(result.score, forKeyPath: "score")
    s.setValue(result.timestampStart, forKeyPath: "timestampStart")
    s.setValue(result.timestampEnd, forKeyPath: "timestampEnd")
    do {
        try managedContext.save()
        return true
    } catch let error as NSError {
        print("Could not save. \(error), \(error.userInfo)")
        return false
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
    s.setValue(setting.sendToTeacher, forKeyPath: "sendToTeacher")
    s.setValue(setting.timePronunciation, forKeyPath: "timePronunciation")
    s.setValue(setting.timeTongueTwisters, forKeyPath: "timeTongueTwisters")
    s.setValue(setting.name, forKeyPath: "name")
    s.setValue(setting.teacherEmail, forKeyPath: "teacherEmail")
    do {
        try managedContext.save()
        return s
    } catch let error as NSError {
        print("Could not save. \(error), \(error.userInfo)")
        return nil
    }
}

func resetAllRecords(_ entityName: String) -> Bool {
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
        return false
    }
    let managedContext = appDelegate.persistentContainer.viewContext
    
    let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
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
