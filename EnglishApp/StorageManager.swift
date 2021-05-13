//
//  StorageManager.swift
//  EnglishApp
//
//  Created by Pasha on 09.05.2021.
//  Copyright © 2021 Pasha. All rights reserved.
//

import Foundation
import RealmSwift

let realm = try! Realm()
let jsData = JsonDataLoader()

class StorageManager {
    var queeiu = jsData.questionData
    static func saveQuestions(){
        
        for question in jsData.questionData {
            print(jsData.questionData.count)
            self.saveObject(question: question)
        }
    }
       
    static func saveObject(question: Question){
        try! realm.write{
            realm.add(question)
        }
    }
}
