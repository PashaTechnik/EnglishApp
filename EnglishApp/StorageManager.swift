//
//  StorageManager.swift
//  EnglishApp
//
//  Created by Pasha on 09.05.2021.
//  Copyright © 2021 Pasha. All rights reserved.
//

import Foundation
import RealmSwift


var realm: Realm = {
    var config = Realm.Configuration(
        schemaVersion: 1,
        migrationBlock: { migration, oldSchemaVersion in
            if (oldSchemaVersion < 1) {}
    })
    config.deleteRealmIfMigrationNeeded = true
    Realm.Configuration.defaultConfiguration = config
    return try! Realm()
}()

let jsData = JsonDataLoader()

class StorageManager {
    
    
    static func saveQuestions(){
        
        for question in jsData.questionData {
            self.saveObject(object: question)
        }
    }
    
    static func clearDatabase(){
        try! realm.write {
          realm.deleteAll()
        }
    }
    
    static func saveTranslate(){
        for translate in jsData.translateData {
            self.saveObject(object: translate)
        }
    }
    
    static func saveTranslateQuiz(){
        for translateQuiz in jsData.translateQuizData {
            self.saveObject(object: translateQuiz)
        }
    }
       
    static func saveObject(object: Any){
        try! realm.write{
            realm.add(object as! Object)
        }
    }
}
