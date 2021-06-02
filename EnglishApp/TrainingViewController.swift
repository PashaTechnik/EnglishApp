import UIKit
import RealmSwift

class TrainingViewController: UIViewController {
    

    var translate: Results<Translate>!
    var translateQuiz: Results<TranslateQuiz>!
    
    @IBOutlet weak var wordTraining_stackView: UIStackView!
    @IBOutlet weak var grammarTraining_stackView: UIStackView!
    
    @IBOutlet weak var reading_stackVeiw: UIStackView!
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
        
        let button_WordTranslate = UIButton(frame: CGRect(x: 0, y: 0, width: 190, height: 150))
        let button_TranslateWord = UIButton(frame: CGRect(x: 0, y: 0, width: 190, height: 150))
        let button_AudioBattle = UIButton(frame: CGRect(x: 0, y: 0, width: 190, height: 150))
        let button_grammarQuiz1 = UIButton(frame: CGRect(x: 0, y: 0, width: 190, height: 150))
        let button_grammarQuiz2 = UIButton(frame: CGRect(x: 0, y: 0, width: 190, height: 150))
        let button_grammarQuiz3 = UIButton(frame: CGRect(x: 0, y: 0, width: 190, height: 150))
        
        let readinBut = UIButton(frame: CGRect(x: 0, y: 0, width: 190, height: 150))
        let readinBut2 = UIButton(frame: CGRect(x: 0, y: 0, width: 190, height: 150))
        
        let readinBut3 = UIButton(frame: CGRect(x: 0, y: 0, width: 250, height: 150))
        
        button_WordTranslate.backgroundColor = UIColor(red: 195.0/255.0, green: 168/255.0, blue: 226/255.0, alpha: 1)
        button_WordTranslate.layer.cornerRadius = 5
        button_WordTranslate.translatesAutoresizingMaskIntoConstraints = false
        //button_WordTranslate.heightAnchor.constraint(equalToConstant:  wordTraining_stackView.frame.height).isActive = true // widthAncor
        button_WordTranslate.setTitle(" Слово-перевод ", for: .normal)
        button_WordTranslate.setTitleColor(.white, for: .normal)
        button_WordTranslate.titleLabel?.font =  UIFont(name: "AmaticSC-Bold", size: 36)
        button_WordTranslate.widthAnchor.constraint(equalToConstant: 190).isActive = true
        button_WordTranslate.heightAnchor.constraint(equalToConstant: 150).isActive = true
        button_WordTranslate.contentHorizontalAlignment = .left
        
        
        
        button_TranslateWord.backgroundColor = UIColor(red: 244/255.0, green: 181/255.0, blue: 122/255.0, alpha: 1)

        button_TranslateWord.layer.cornerRadius = 5
        button_TranslateWord.translatesAutoresizingMaskIntoConstraints = false
        //button_TranslateWord.widthAnchor.constraint(equalToConstant: wordTraining_stackView.frame.height).isActive = true
        button_TranslateWord.setTitle(" Перевод-слово ", for: .normal)
        button_TranslateWord.setTitleColor(.white, for: .normal)
        button_TranslateWord.titleLabel?.font =  UIFont(name: "AmaticSC-Bold", size: 36)
        button_TranslateWord.widthAnchor.constraint(equalToConstant: 190).isActive = true
        button_TranslateWord.heightAnchor.constraint(equalToConstant: 150).isActive = true
        button_TranslateWord.contentHorizontalAlignment = .left
        

        
        button_AudioBattle.backgroundColor = UIColor(red: 144/255.0, green: 203/255.0, blue: 230/255.0, alpha: 1)

        button_AudioBattle.layer.cornerRadius = 5
        button_AudioBattle.translatesAutoresizingMaskIntoConstraints = false
        //button_AudioBattle.widthAnchor.constraint(equalToConstant: wordTraining_stackView.frame.height).isActive = true
        
        button_AudioBattle.setTitle(" Карточки ", for: .normal)
        button_AudioBattle.setTitleColor(.white, for: .normal)
        button_AudioBattle.titleLabel?.font =  UIFont(name: "AmaticSC-Bold", size: 36)
        button_AudioBattle.widthAnchor.constraint(equalToConstant: 190).isActive = true
        button_AudioBattle.heightAnchor.constraint(equalToConstant: 150).isActive = true
        button_AudioBattle.contentHorizontalAlignment = .left

        
        button_grammarQuiz1.backgroundColor = UIColor(red: 144/255.0, green: 203/255.0, blue: 230/255.0, alpha: 1)
        button_grammarQuiz1.layer.cornerRadius = 5
        button_grammarQuiz1.translatesAutoresizingMaskIntoConstraints = false
       // button_grammarQuiz1.widthAnchor.constraint(equalToConstant: wordTraining_stackView.frame.height).isActive = true
        
        button_grammarQuiz1.setTitle(" Present Simple ", for: .normal)
        button_grammarQuiz1.setTitleColor(.white, for: .normal)
        button_grammarQuiz1.titleLabel?.font =  UIFont(name: "AmaticSC-Bold", size: 36)
        button_grammarQuiz1.widthAnchor.constraint(equalToConstant: 190).isActive = true
        button_grammarQuiz1.heightAnchor.constraint(equalToConstant: 150).isActive = true
        button_grammarQuiz1.contentHorizontalAlignment = .left
        


        button_AudioBattle.addTarget(self, action: #selector(self.goToCards(sender:)), for: .touchUpInside)
        button_grammarQuiz1.addTarget(self, action: #selector(self.goToExercise(sender:)), for: .touchUpInside)
        button_TranslateWord.addTarget(self, action: #selector(self.goToTranslate(sender:)), for: .touchUpInside)
        button_WordTranslate.addTarget(self, action: #selector(self.goToTranslateQuiz(sender:)), for: .touchUpInside)

        
        button_grammarQuiz2.backgroundColor = UIColor(red: 123/255.0, green: 155/255.0, blue:221/255.0, alpha: 1)
        button_grammarQuiz2.layer.cornerRadius = 5
        button_grammarQuiz2.translatesAutoresizingMaskIntoConstraints = false
        //button_grammarQuiz2.widthAnchor.constraint(equalToConstant: wordTraining_stackView.frame.height).isActive = true
        
        button_grammarQuiz2.setTitle(" Present Perfect ", for: .normal)
        button_grammarQuiz2.setTitleColor(.white, for: .normal)
        button_grammarQuiz2.titleLabel?.font =  UIFont(name: "AmaticSC-Bold", size: 36)
        button_grammarQuiz2.widthAnchor.constraint(equalToConstant: 190).isActive = true
        button_grammarQuiz2.heightAnchor.constraint(equalToConstant: 150).isActive = true
        button_grammarQuiz2.contentHorizontalAlignment = .left

        
        
        
        button_grammarQuiz3.setTitle(" Past Simple ", for: .normal)
        button_grammarQuiz3.setTitleColor(.white, for: .normal)
        button_grammarQuiz3.titleLabel?.font =  UIFont(name: "AmaticSC-Bold", size: 36)
        button_grammarQuiz3.backgroundColor = UIColor(red: 96/255.0, green: 197/255.0, blue: 186/255.0, alpha: 1)
        button_grammarQuiz3.layer.cornerRadius = 5
        button_grammarQuiz3.translatesAutoresizingMaskIntoConstraints = false
//        button_grammarQuiz3.widthAnchor.constraint(equalToConstant: wordTraining_stackView.frame.height).isActive = true
        button_grammarQuiz3.widthAnchor.constraint(equalToConstant: 190).isActive = true
        button_grammarQuiz3.heightAnchor.constraint(equalToConstant: 150).isActive = true
        button_grammarQuiz3.contentHorizontalAlignment = .left
        

        readinBut.backgroundColor =  UIColor(red: 252/255.0, green: 139/255.0, blue: 108/255.0, alpha: 1)
        readinBut.layer.cornerRadius = 5
        readinBut.translatesAutoresizingMaskIntoConstraints = false
        //readinBut.widthAnchor.constraint(equalToConstant: wordTraining_stackView.frame.height).isActive = true
        readinBut.widthAnchor.constraint(equalToConstant: 190).isActive = true
        readinBut.heightAnchor.constraint(equalToConstant: 150).isActive = true
        readinBut.contentHorizontalAlignment = .left
        
        
        readinBut.setTitle(" Истории 1", for: .normal)
        readinBut.setTitleColor(.white, for: .normal)
        readinBut.titleLabel?.font =  UIFont(name: "AmaticSC-Bold", size: 36)
        
        
        readinBut2.setTitle(" Истории 2", for: .normal)
        readinBut2.setTitleColor(.white, for: .normal)
        readinBut2.titleLabel?.font =  UIFont(name: "AmaticSC-Bold", size: 36)
        readinBut2.backgroundColor = UIColor(red: 219/255.0, green: 193/255.0, blue: 149/255.0, alpha: 1)
        readinBut2.layer.cornerRadius = 5
        readinBut2.translatesAutoresizingMaskIntoConstraints = false
        //readinBut2.widthAnchor.constraint(equalToConstant: wordTraining_stackView.frame.height).isActive = true
        
        readinBut2.widthAnchor.constraint(equalToConstant: 190).isActive = true
        readinBut2.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        
        readinBut3.setTitle(" Истории 3", for: .normal)
        readinBut3.setTitleColor(.white, for: .normal)
        readinBut3.titleLabel?.font =  UIFont(name: "AmaticSC-Bold", size: 36)
        readinBut3.backgroundColor = UIColor(red: 96/255.0, green: 197/255.0, blue: 186/255.0, alpha: 1)
        readinBut3.layer.cornerRadius = 5
        readinBut3.translatesAutoresizingMaskIntoConstraints = false
        //readinBut3.widthAnchor.constraint(equalToConstant: wordTraining_stackView.frame.height).isActive = true
        
        readinBut3.widthAnchor.constraint(equalToConstant: 190).isActive = true
        readinBut3.heightAnchor.constraint(equalToConstant: 150).isActive = true
        readinBut3.contentHorizontalAlignment = .left
      



        
        wordTraining_stackView.addArrangedSubview(button_WordTranslate)
        wordTraining_stackView.addArrangedSubview(button_TranslateWord)
        wordTraining_stackView.addArrangedSubview(button_AudioBattle)
        grammarTraining_stackView.addArrangedSubview(button_grammarQuiz1)
        grammarTraining_stackView.addArrangedSubview(button_grammarQuiz2)
        grammarTraining_stackView.addArrangedSubview(button_grammarQuiz3)
        
        reading_stackVeiw.addArrangedSubview(readinBut)
        reading_stackVeiw.addArrangedSubview(readinBut2)
        reading_stackVeiw.addArrangedSubview(readinBut3)
    }
    
    @objc func goToExercise(sender: UIButton!){
        self.performSegue(withIdentifier: "goToGrammar", sender: self)
    }
    
    @objc func goToCards(sender: UIButton!){
        self.performSegue(withIdentifier: "goToCards", sender: self)
    }
    
    @objc func goToTranslate(sender: UIButton!){
        self.performSegue(withIdentifier: "goToTranslate", sender: self)
    }
    @objc func goToTranslateQuiz(sender: UIButton!){
        self.performSegue(withIdentifier: "goToTranslateQuiz", sender: self)
    }
    
    
}
