//
//  TranslateQuiz.swift
//  EnglishApp
//
//  Created by Pasha on 29.05.2021.
//  Copyright © 2021 Pasha. All rights reserved.
//

import Foundation
import RealmSwift

class TranslateQuiz: Object, Codable{
    @objc dynamic var id = 0
    @objc dynamic var word: String?
    @objc dynamic var translate1: String?
    @objc dynamic var translate2: String?
    @objc dynamic var translate3: String?
    @objc dynamic var translate4: String?
    @objc dynamic var right = 0
    @objc dynamic var level: String?
    
    required init(id: Int, word: String?, translate1: String?, translate2: String?, translate3: String?, translate4: String?,right: Int, level: String){
        self.id = id
        self.word = word
        self.translate1 = translate1
        self.translate2 = translate2
        self.translate3 = translate3
        self.translate4 = translate4
        self.right = right
        self.level = level
    }
    
    required init() { }
}
