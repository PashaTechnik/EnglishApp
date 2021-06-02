import UIKit
import RealmSwift

class TranslateQuestionsViewController: UIViewController {

    @IBOutlet weak var wordTextLabel: UILabel!
    @IBOutlet weak var pointsTextLabel: UILabel!
    @IBOutlet weak var wordTextField: UITextField!
    
    public var allQuestions: Results<Translate>!
    public static var answerIndex = 0
    public var actualQuestions: [Translate]?
    override func viewDidLoad() {
        allQuestions = realm.objects(Translate.self)
        defineActualQuestions()
        pointsTextLabel.isHidden = true
        print(allQuestions.count)
        
        if actualQuestions?.count != 0 {
            wordTextLabel.text = actualQuestions?[0].word
        }
        else {
            wordTextLabel.text = ""
        }
        
        super.viewDidLoad()

        
    }
    
    func defineActualQuestions(){
        var questions = Array(allQuestions).filter {
            $0.level == CurrentUser.Level
        }
        for questionId in CurrentUser.TranslateQuestions ?? [] {
            questions = questions.filter {
                $0.id != questionId
            }
        }
        actualQuestions = questions
    }

    @IBAction func checkWord(_ sender: Any) {
        if TranslateQuestionsViewController.answerIndex >= actualQuestions!.count {
            TranslateQuestionsViewController.answerIndex = 0
            return
        }
        let answer = wordTextField.text

        if answer == actualQuestions![TranslateQuestionsViewController.answerIndex].word {
            pointsTextLabel.isHidden = false
            pointsTextLabel.textColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
            pointsTextLabel.text = "+5 Points"
            NetworkManager.editPoints(points: 5)
            NetworkManager.editTranslateQuestions(translateQuestionIndex: actualQuestions![TranslateQuestionsViewController.answerIndex].id)
            TranslateQuestionsViewController.answerIndex += 1
        }
        else {
            pointsTextLabel.isHidden = false
            pointsTextLabel.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            pointsTextLabel.text = "+0 Points"
            TranslateQuestionsViewController.answerIndex += 1
        }
        if TranslateQuestionsViewController.answerIndex < actualQuestions!.count {
            wordTextLabel.text = actualQuestions![TranslateQuestionsViewController.answerIndex].word
        }
    }
}
