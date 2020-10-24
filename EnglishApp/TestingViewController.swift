import UIKit
import AVFoundation

// only testing
let ts_words = ["cat","dog","house","table"]
let ts_answers = [["кот","собака","стол","стул"],["кот","стул","собака","енот"],["енот","дом","стол","конь"],["конь","собака","кот","стол"]]
let ts_rightAnswers = [1,3,2,4]

let ts_grammar = ["It's a great place to live apart from the increasing volume of __ that passes under my window every day.","We __a lovely three weeks in the south of Spain last year.","Alex __ judo after school every Friday.","You must come quickly now or we won't _ the bus.","How __ have you and your family lived in this flat?"]
let ts_answers_grammar = [["traffic","vehicles","transport","circulation"],["took","did","passed","spent"],["makes","goes","plays","does"],["take","meet","catch","run"],["soon","much","often","long"]]
let ts_rightAnswers_grammar = [2,4,2,3,4]

let ts_listening_words = ["","",""]
let ts_listening_answers = ["logical","attractive","complicated"]

let ts_transl = ["сильный","добрый","окно"]
let ts_transl_answers = ["strong","kind","window"]

var score :Int = 0
var count :Int = 0
var segment:Int = 1

var isLast:Bool = false

func levelShow() -> String
{
    if score > 12 {
        return "Advanced"
    }
    else if (score > 9 && score <= 12)
    {
        return "Intermediate"
    }
    else {
        return "Kindergarden"
    }
}

class TestingViewController: UIViewController, UITextFieldDelegate {
    var audioPlayer : AVAudioPlayer!

    @IBOutlet weak var vocab_task_Label: UILabel!
    @IBOutlet weak var grammar_task_Label: UILabel!
    @IBOutlet weak var choice1_test_button: UIButton!
    @IBOutlet weak var choice2_test_button: UIButton!
    @IBOutlet weak var choice3_test_button: UIButton!
    @IBOutlet weak var choice4_test_button: UIButton!
    @IBOutlet weak var answer_textField: UITextField!
    @IBOutlet weak var listening_Button: UIButton!
    @IBOutlet weak var listening_status_label: UILabel!
    @IBOutlet weak var progress_bar: UIProgressView!
    
    let progress = Progress(totalUnitCount: 14)
    
    @IBAction func soundBtn(_ sender: UIButton) { // sound button tapped
        audioPlayer!.play()
    }
    
    @IBAction func ReturnKeyPressed(_ sender: UITextField) { // keyboard return key pressed
        textFieldShouldReturn(answer_textField)
        
        if (segment == 3) {
        if answer_textField.text == ts_listening_answers[count]
        {
            score += 1
            print(score)
            listening_status_label.text = ts_listening_answers[count]
            listening_status_label.textColor = .green
        }
        else
        {
            listening_status_label.text = ts_listening_answers[count]
            listening_status_label.textColor = .red
        }
        sleep(1);
        answer_textField.text = nil;
        
        
        if (count == 2)
        {
            isLast = true
        }
        if !isLast
        {
            count += 1
            
            self.progress.completedUnitCount += 1
            let progressFloat = Float(self.progress.fractionCompleted)
            self.progress_bar.setProgress(progressFloat, animated: true)
            
            audio(i: count)
            audioPlayer!.play()
        }
        else {
            segment = 4
            isLast = false
            count = 0;
            view4()
            listening_status_label.text = nil
            answer_textField.text = nil;
            newTransl(i: count)
        }
        } // реагирует на 4 сегмент
        else
        {
            //newTransl(i: count)
            if (answer_textField.text == ts_transl_answers[count])
            {
                listening_status_label.text = "правильно"
                listening_status_label.textColor = .green
                score += 1
                print(score)
            }
            else
            {
                listening_status_label.text = "не правильно"
                listening_status_label.textColor = .red
            }
            sleep(1);
            answer_textField.text = nil;
            
            if (count == 2)
            {
                isLast = true
            }
            if !isLast
            {
                count += 1
                
                self.progress.completedUnitCount += 1
                let progressFloat = Float(self.progress.fractionCompleted)
                self.progress_bar.setProgress(progressFloat, animated: true)
                
                newTransl(i: count)
                
            }
            else
            {
                isLast = false
                view5()
                //score = 0
                count = 0
            }
        }
    }
    
    @IBAction func answerButtonTapped(_ sender: UIButton) { // only testing
        if (segment == 1) {
        
        if (sender.tag == ts_rightAnswers[count])
        {
            score += 1
            print(score)
        }
        count += 1
        
            self.progress.completedUnitCount += 1
            let progressFloat = Float(self.progress.fractionCompleted)
            self.progress_bar.setProgress(progressFloat, animated: true)
            
        if (count == 3)
        {
            isLast = true
        }
        if !isLast{
            newQues(i: count) }
        else
        {
            count = 0
            view2()
            newGramQuestion(i: 0)
            segment = 2
            isLast = false
        }
        }
        else
        {
            if (sender.tag == ts_rightAnswers_grammar[count]) {
                score += 1
                
                print(score)
            }
            count += 1
            
            self.progress.completedUnitCount += 1
            let progressFloat = Float(self.progress.fractionCompleted)
            self.progress_bar.setProgress(progressFloat, animated: true)
            
            if (count == 4)
            {
                isLast = true
            }
            
            if !isLast
            {
                newGramQuestion(i: count)
            }
            else
            {
                segment = 3
                view3()
                count = 0
                isLast = false
                audio(i: count)
                audioPlayer!.play()
                
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.progress_bar.progress = 0
    }
    
    func textFieldShouldReturn(_ scoreText: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    override func viewDidAppear(_ animated: Bool) { // new test every time when appeared
        score = 0
        view1()
        newQues(i: 0)
        self.progress_bar.progress = 0
        progress_bar.isHidden = false;
        
        self.progress.completedUnitCount = 0
        let progressFloat = Float(self.progress.fractionCompleted)
        self.progress_bar.setProgress(progressFloat, animated: true)
        
    }
    
    func audio(i: Int)
    {
        var str = "Sounds/" + ts_listening_answers[i];
        let sound = Bundle.main.path (forResource: str, ofType: "mp3")!
        let url = URL(fileURLWithPath: sound)
        do {
           audioPlayer = try AVAudioPlayer(contentsOf: url)
        } catch{
        }
    }
    
    func newTransl(i:Int)
    {
        vocab_task_Label.text = ts_transl[i];
    }
    func newQues(i: Int)  { // only testing
        vocab_task_Label.text = ts_words[i]
        choice1_test_button.setTitle(ts_answers[i][0], for: .normal)
        choice2_test_button.setTitle(ts_answers[i][1], for: .normal)
        choice3_test_button.setTitle(ts_answers[i][2], for: .normal)
        choice4_test_button.setTitle(ts_answers[i][3], for: .normal)
    }
    
    func newGramQuestion(i:Int) {
        grammar_task_Label.text = ts_grammar[i]
        choice1_test_button.setTitle(ts_answers_grammar[i][0], for: .normal)
        choice2_test_button.setTitle(ts_answers_grammar[i][1], for: .normal)
        choice3_test_button.setTitle(ts_answers_grammar[i][2], for: .normal)
        choice4_test_button.setTitle(ts_answers_grammar[i][3], for: .normal)
    }

    func view1 (){ //тест словарный
        grammar_task_Label.isHidden = true;
        answer_textField.isHidden = true;
        choice1_test_button.isHidden = false;
        choice2_test_button.isHidden = false;
        choice3_test_button.isHidden = false;
        choice4_test_button.isHidden = false;
        vocab_task_Label.isHidden = false;
        listening_Button.isHidden = true;
        listening_status_label.isHidden = true;
    }
    
    func view2() { // тест граматика
        answer_textField.isHidden = true;
        vocab_task_Label.isHidden = true;
        choice1_test_button.isHidden = false;
        choice2_test_button.isHidden = false;
        choice3_test_button.isHidden = false;
        choice4_test_button.isHidden = false;
        grammar_task_Label.isHidden = false;
        listening_Button.isHidden = true;
        listening_status_label.isHidden = true;
    }
    func view3() { // аудирование
        answer_textField.isHidden = false;
        vocab_task_Label.isHidden = true;
        choice1_test_button.isHidden = true;
        choice2_test_button.isHidden = true;
        choice3_test_button.isHidden = true;
        choice4_test_button.isHidden = true;
        grammar_task_Label.isHidden = true;
        listening_Button.isHidden = false;
        listening_status_label.isHidden = false;
    }
    func view4 () { //слово-перевод
        answer_textField.isHidden = false;
        vocab_task_Label.isHidden = false;
        choice1_test_button.isHidden = true;
        choice2_test_button.isHidden = true;
        choice3_test_button.isHidden = true;
        choice4_test_button.isHidden = true;
        grammar_task_Label.isHidden = true;
        listening_Button.isHidden = true;
        listening_status_label.isHidden = false;
        
        answer_textField.placeholder = "перевод"
    }
    
    func view5() { // результат
        var string = "Результат " + String(score)
        
        
        answer_textField.isHidden = true;
        vocab_task_Label.isHidden = false;
        choice1_test_button.isHidden = true;
        choice2_test_button.isHidden = true;
        choice3_test_button.isHidden = true;
        choice4_test_button.isHidden = true;
        grammar_task_Label.isHidden = true;
        listening_Button.isHidden = true;
        listening_status_label.isHidden = true;
        
        vocab_task_Label.text = string;
        progress_bar.isHidden = true;
        
    }
    
}
