import UIKit
import RealmSwift

class TrainingViewController: UIViewController {
    

    var translate: Results<Translate>!
    var translateQuiz: Results<TranslateQuiz>!
    
    @IBOutlet weak var wordTraining_stackView: UIStackView!
    @IBOutlet weak var grammarTraining_stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        questions = realm.objects(Question.self)
//        translate = realm.objects(Translate.self)
//        translateQuiz = realm.objects(TranslateQuiz.self)
//        print(questions.count)
//        print(translate.count)
//        print(translateQuiz.count)
        view1()
        

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
   
    }
    
    func view1() {
        let button_WordTranslate = UIButton(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        let button_TranslateWord = UIButton(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        let button_AudioBattle = UIButton(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        let button_grammarQuiz = UIButton(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        
        button_WordTranslate.backgroundColor = .blue
        button_WordTranslate.layer.cornerRadius = 5
        button_WordTranslate.translatesAutoresizingMaskIntoConstraints = false
        button_WordTranslate.widthAnchor.constraint(equalToConstant: wordTraining_stackView.frame.height).isActive = true
        
        button_TranslateWord.backgroundColor = .blue
        button_TranslateWord.layer.cornerRadius = 5
        button_TranslateWord.translatesAutoresizingMaskIntoConstraints = false
        button_TranslateWord.widthAnchor.constraint(equalToConstant: wordTraining_stackView.frame.height).isActive = true
        
        button_AudioBattle.backgroundColor = .blue
        button_AudioBattle.layer.cornerRadius = 5
        button_AudioBattle.translatesAutoresizingMaskIntoConstraints = false
        button_AudioBattle.widthAnchor.constraint(equalToConstant: wordTraining_stackView.frame.height).isActive = true
        
        button_grammarQuiz.backgroundColor = .blue
        button_grammarQuiz.layer.cornerRadius = 5
        button_grammarQuiz.translatesAutoresizingMaskIntoConstraints = false
        button_grammarQuiz.widthAnchor.constraint(equalToConstant: wordTraining_stackView.frame.height).isActive = true
        
        let image = UIImage(named: "refreshButton") as UIImage?
        button_grammarQuiz.setImage(image, for: .normal)
        
        button_grammarQuiz.addTarget(self, action: #selector(self.goToExercise(sender:)), for: .touchUpInside)
        

        wordTraining_stackView.addArrangedSubview(button_WordTranslate)
        wordTraining_stackView.addArrangedSubview(button_TranslateWord)
        wordTraining_stackView.addArrangedSubview(button_AudioBattle)
        grammarTraining_stackView.addArrangedSubview(button_grammarQuiz)
    }
    
    @objc func goToExercise(sender: UIButton!){
        self.performSegue(withIdentifier: "goToTrain", sender: self)
    }
    
}
