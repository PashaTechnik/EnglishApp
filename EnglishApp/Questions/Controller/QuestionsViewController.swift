//
//  QuestionsViewController.swift
//  EnglishApp
//
//  Created by Pasha on 13.05.2021.
//  Copyright © 2021 Pasha. All rights reserved.
//

import UIKit
import RealmSwift

class QuestionsViewController: UIViewController {
    @IBOutlet weak var questionTextLabel: UILabel!
    @IBOutlet weak var answerTextField: UITextField!
    @IBOutlet weak var requestTextLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    
    public var allQuestions: Results<Question>!
    public static var answerIndex = 0
    public var actualQuestions: [Question]?
    
    
    override func viewDidLoad() {
        allQuestions = realm.objects(Question.self)
        defineActualQuestions()
        
        print(allQuestions.count)
        requestTextLabel.isHidden = true
        pointsLabel.isHidden = true
        
        if actualQuestions?.count != 0 {
            questionTextLabel.text = actualQuestions?[0].question
        }
        else {
            questionTextLabel.text = ""
        }

        super.viewDidLoad()
        
    }
    
    func defineActualQuestions(){
        var questions = Array(allQuestions).filter {
            $0.level == CurrentUser.Level
        }
        for questionId in CurrentUser.GrammarQuestions ?? [] {
            questions = questions.filter {
                $0.id != questionId
            }
        }
        actualQuestions = questions
    }

    @IBAction func checkAnswer(_ sender: Any) {
        
        if QuestionsViewController.answerIndex >= actualQuestions!.count {
            QuestionsViewController.answerIndex = 0
            return
        }
        var answer = answerTextField.text

        if answer == actualQuestions![QuestionsViewController.answerIndex].answer {
            requestTextLabel.isHidden = false
            requestTextLabel.text = actualQuestions![QuestionsViewController.answerIndex].answer
            pointsLabel.isHidden = false
            pointsLabel.textColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
            pointsLabel.text = "+5 Points"
            NetworkManager.editPoints(points: 5)
            NetworkManager.editGrammarQuestions(grammarQuestionIndex: actualQuestions![QuestionsViewController.answerIndex].id)
            QuestionsViewController.answerIndex += 1
        }
        else {

            requestTextLabel.isHidden = false
            requestTextLabel.text = actualQuestions![QuestionsViewController.answerIndex].answer
            pointsLabel.isHidden = false
            pointsLabel.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            pointsLabel.text = "+0 Points"
            QuestionsViewController.answerIndex += 1
        }
        if QuestionsViewController.answerIndex < actualQuestions!.count {
            questionTextLabel.text = actualQuestions![QuestionsViewController.answerIndex].question
        } else{
            // TODO: finish
        }
    }
}

