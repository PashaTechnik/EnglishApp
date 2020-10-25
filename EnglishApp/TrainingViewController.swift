import UIKit

class TrainingViewController: UIViewController {
    

    @IBOutlet weak var wordTraining_stackView: UIStackView!
    @IBOutlet weak var grammarTraining_stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)


        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        //button.constraints.
        button.backgroundColor = .blue
        button.layer.cornerRadius = 5
        
       // button.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: wordTraining_stackView.frame.height).isActive = true
        

    
        let button2 = UIButton(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        //button.constraints.
        button2.backgroundColor = .blue
        button2.layer.cornerRadius = 5
        
       // button.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        
        button2.translatesAutoresizingMaskIntoConstraints = false
        button2.widthAnchor.constraint(equalToConstant: wordTraining_stackView.frame.height).isActive = true
        
        grammarTraining_stackView.addArrangedSubview(button)
        wordTraining_stackView.addArrangedSubview(button2)
   
    }
}
