import UIKit
import RealmSwift

class TranslateQuizViewController: UIViewController {

    @IBOutlet weak var wordTexLabel: UILabel!
    
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var translateBtn1: UIButton!
    @IBOutlet weak var translateBtn2: UIButton!
    @IBOutlet weak var translateBtn3: UIButton!
    @IBOutlet weak var translateBtn4: UIButton!
    
    public var allQuestions: Results<TranslateQuiz>!
    public static var answerIndex = 0
    public var actualQuestions: [TranslateQuiz]?
    
    override func viewDidLoad() {
        allQuestions = realm.objects(TranslateQuiz.self)
        defineActualQuestions()
        print(allQuestions.count)
        pointsLabel.isHidden = true
        
        if actualQuestions?.count != 0 {
            wordTexLabel.text = actualQuestions?[0].word
            translateBtn1.setTitle(actualQuestions?[0].translate1, for: .normal)
            translateBtn2.setTitle(actualQuestions?[0].translate2, for: .normal)
            translateBtn3.setTitle(actualQuestions?[0].translate3, for: .normal)
            translateBtn4.setTitle(actualQuestions?[0].translate4, for: .normal)
        }
        else {
            wordTexLabel.text = ""
        }
        super.viewDidLoad()

    }
    
    func defineActualQuestions(){
        var questions = Array(allQuestions).filter {
            $0.level == CurrentUser.Level
        }
        for questionId in CurrentUser.TranslateQuiz ?? [] {
            questions = questions.filter {
                $0.id != questionId
            }
        }
        actualQuestions = questions
    }

    @IBAction func translate1(_ sender: Any) {
        if TranslateQuizViewController.answerIndex >= actualQuestions!.count {
            TranslateQuizViewController.answerIndex = 0
            return
        }
        
        if actualQuestions![TranslateQuizViewController.answerIndex].right == 1 {
            pointsLabel.isHidden = false
            pointsLabel.textColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
            pointsLabel.text = "+5 Points"
            NetworkManager.editPoints(points: 5)
            NetworkManager.editTranslateQuiz(translateQuizIndex: actualQuestions![QuestionsViewController.answerIndex].id)
            TranslateQuizViewController.answerIndex += 1
        }
        else {
            pointsLabel.isHidden = false
            pointsLabel.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            pointsLabel.text = "+0 Points"
            TranslateQuizViewController.answerIndex += 1
        }
        if TranslateQuizViewController.answerIndex < actualQuestions!.count {
            wordTexLabel.text = actualQuestions![TranslateQuizViewController.answerIndex].word
            translateBtn1.setTitle(actualQuestions?[TranslateQuizViewController.answerIndex].translate1, for: .normal)
        }
        
    }
    @IBAction func translate2(_ sender: Any) {
        if TranslateQuizViewController.answerIndex >= actualQuestions!.count {
            TranslateQuizViewController.answerIndex = 0
            return
        }
        if actualQuestions![TranslateQuizViewController.answerIndex].right == 2 {
            pointsLabel.isHidden = false
            pointsLabel.textColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
            pointsLabel.text = "+5 Points"
            NetworkManager.editPoints(points: 5)
            NetworkManager.editTranslateQuiz(translateQuizIndex: actualQuestions![QuestionsViewController.answerIndex].id)
            TranslateQuizViewController.answerIndex += 1
        }
        else {
            pointsLabel.isHidden = false
            pointsLabel.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            pointsLabel.text = "+0 Points"
            TranslateQuizViewController.answerIndex += 1
        }
        
        if TranslateQuizViewController.answerIndex < actualQuestions!.count {
            wordTexLabel.text = actualQuestions![TranslateQuizViewController.answerIndex].word
            translateBtn2.setTitle(actualQuestions?[TranslateQuizViewController.answerIndex].translate2, for: .normal)
        }
        
    }
    @IBAction func translate3(_ sender: Any) {
        if TranslateQuizViewController.answerIndex >= actualQuestions!.count {
            TranslateQuizViewController.answerIndex = 0
            return
        }
        if actualQuestions![TranslateQuizViewController.answerIndex].right == 3 {
            pointsLabel.isHidden = false
            pointsLabel.textColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
            pointsLabel.text = "+5 Points"
            NetworkManager.editPoints(points: 5)
            NetworkManager.editTranslateQuiz(translateQuizIndex: actualQuestions![QuestionsViewController.answerIndex].id)
            TranslateQuizViewController.answerIndex += 1
        }
        else {
            pointsLabel.isHidden = false
            pointsLabel.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            pointsLabel.text = "+0 Points"
            TranslateQuizViewController.answerIndex += 1
        }
        if TranslateQuizViewController.answerIndex < actualQuestions!.count {
            wordTexLabel.text = actualQuestions![TranslateQuizViewController.answerIndex].word
            translateBtn3.setTitle(actualQuestions?[TranslateQuizViewController.answerIndex].translate3, for: .normal)
        }
        
    }
    @IBAction func transtale4(_ sender: Any) {
        if TranslateQuizViewController.answerIndex >= actualQuestions!.count {
            TranslateQuizViewController.answerIndex = 0
            return
        }
        if actualQuestions![TranslateQuizViewController.answerIndex].right == 4 {
            pointsLabel.isHidden = false
            pointsLabel.textColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
            pointsLabel.text = "+5 Points"
            NetworkManager.editPoints(points: 5)
            NetworkManager.editTranslateQuiz(translateQuizIndex: actualQuestions![QuestionsViewController.answerIndex].id)
            TranslateQuizViewController.answerIndex += 1
        }
        else {
            pointsLabel.isHidden = false
            pointsLabel.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            pointsLabel.text = "+0 Points"
            TranslateQuizViewController.answerIndex += 1
        }
        if TranslateQuizViewController.answerIndex < actualQuestions!.count {
            wordTexLabel.text = actualQuestions![TranslateQuizViewController.answerIndex].word
            translateBtn4.setTitle(actualQuestions?[TranslateQuizViewController.answerIndex].translate4, for: .normal)
        }
    }
}
