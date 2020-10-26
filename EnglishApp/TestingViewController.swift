import UIKit
import AVFoundation


class TestingViewController: UIViewController, UITextFieldDelegate {
    var user = User(name: "empty", email: "empty", password: "empty")

    
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
    @IBOutlet weak var endTestButton: UIButton!
    
    var score: Int = 0
    var count: Int = 0
    var segment: Int = 1
    var isLast: Bool = false

    let jsData = JsonDataLoader()
    let progress = Progress(totalUnitCount: 14)
    
    
    @IBAction func soundBtn(_ sender: UIButton) { // sound button tapped
        audioPlayer!.play()
    }
    
    @IBAction func ReturnKeyPressed(_ sender: UITextField) { // keyboard return key pressed
        textFieldShouldReturn(answer_textField)
        
        if (segment == 3) {
            if answer_textField.text == jsData.listeningData[count].question
        {
            score += 1
            listening_status_label.text = jsData.listeningData[count].question
            listening_status_label.textColor = .green
        }
        else
        {
            listening_status_label.text = jsData.listeningData[count].question
            listening_status_label.textColor = .red
        }
        sleep(1)
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
            if (answer_textField.text == jsData.translateData[count].answer)
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
                count = 0
            }
        }
    }
    
    @IBAction func answerButtonTapped(_ sender: UIButton) { // only testing
        if (segment == 1) {
        
        if (sender.tag == jsData.tesingQuizData[count].right)
        {
            score += 1
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
            if (sender.tag == jsData.grammarData[count].right) {
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
            // self.progress_bar.progress = 0
        
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
        var str = "Sounds/" + jsData.listeningData[i].question
        let sound = Bundle.main.path (forResource: str, ofType: "mp3")!
        let url = URL(fileURLWithPath: sound)
        do {
           audioPlayer = try AVAudioPlayer(contentsOf: url)
        } catch{
        }
    }
    
    func newTransl(i:Int)
    {
        vocab_task_Label.text = jsData.translateData[i].question
        
    }
    func newQues(i: Int)  { // only testing
        
        vocab_task_Label.text = jsData.tesingQuizData[i].question
        choice1_test_button.setTitle(jsData.tesingQuizData[i].answer1, for: .normal)
        choice2_test_button.setTitle(jsData.tesingQuizData[i].answer2, for: .normal)
        choice3_test_button.setTitle(jsData.tesingQuizData[i].answer3, for: .normal)
        choice4_test_button.setTitle(jsData.tesingQuizData[i].answer4, for: .normal)
    }
    
    func newGramQuestion(i:Int) {
        grammar_task_Label.text = jsData.grammarData[i].question
        choice1_test_button.setTitle(jsData.grammarData[i].answer1, for: .normal)
        choice2_test_button.setTitle(jsData.grammarData[i].answer2, for: .normal)
        choice3_test_button.setTitle(jsData.grammarData[i].answer3, for: .normal)
        choice4_test_button.setTitle(jsData.grammarData[i].answer4, for: .normal)
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
        endTestButton.isHidden = true
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
        endTestButton.isHidden = true
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
        endTestButton.isHidden = true
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
        endTestButton.isHidden = true
        answer_textField.placeholder = "перевод"
    }

    func view5() { // результат
        var string = "Результат " + String(score) //testing
        
        answer_textField.isHidden = true;
        vocab_task_Label.isHidden = false;
        choice1_test_button.isHidden = true;
        choice2_test_button.isHidden = true;
        choice3_test_button.isHidden = true;
        choice4_test_button.isHidden = true;
        grammar_task_Label.isHidden = true;
        listening_Button.isHidden = true;
        listening_status_label.isHidden = true;
        endTestButton.isHidden = false
        
        vocab_task_Label.text = string;
        progress_bar.isHidden = true;
    }
    
    @IBAction func EndTestBtn(_ sender: Any) {
        user.points = score
        Networking.addUser(user)
    }
    
    
    
}




