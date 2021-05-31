//
//  File.swift
//  EnglishApp
//
//  Created by Pasha on 08.05.2021.
//  Copyright © 2021 Pasha. All rights reserved.
//

import Foundation
import RealmSwift

class Question: Object, Codable{
    @objc dynamic var id = 0
    @objc dynamic var Description: String?
    @objc dynamic var question: String?
    @objc dynamic var answer: String?
    @objc dynamic var level: String?
    
    
    required init(id: Int, description: String?, question: String?, answer: String?, level: String?){
        self.id = id
        self.Description = description
        self.question = question
        self.answer = answer
        self.level = level
    }
    
    required init() { }
    
}
