//
//  CurrentUserViewModel.swift
//  EnglishApp
//
//  Created by Pasha on 30.05.2021.
//  Copyright © 2021 Pasha. All rights reserved.
//

import UIKit
class CurrentUser {
    
    public static var Dictionary: Dictionary<String,String>?
    public static var Image: UIImage?
    public static var FirstName: String?
    public static var LastName: String?
    public static var Points: Int?
    public static var GrammarQuestions: Array<Int>?
    public static var TranslateQuestions: Array<Int>?
    public static var TranslateQuiz: Array<Int>?
    public static var Level: String {
        switch Points! {
        case 0...100:
            return "A1"
        case 101...200:
            return "A2"
        case 201...300:
            return "B1"
        case 301...400:
            return "B2"
        default:
            return "C1"
        }
    }
    
    
    init(firstName: String, lastName: String, points: Int, dictionary: Dictionary<String,String>, profileImage: UIImage, grammarQuestions: Array<Int>, translateQuiz: Array<Int>, translateQuestions: Array<Int>) {
        CurrentUser.Dictionary = dictionary
        CurrentUser.Image = profileImage
        CurrentUser.FirstName = firstName
        CurrentUser.LastName = lastName
        CurrentUser.Points = points
        CurrentUser.GrammarQuestions = grammarQuestions
        CurrentUser.TranslateQuiz = translateQuiz
        CurrentUser.TranslateQuestions = translateQuestions
    }
}

