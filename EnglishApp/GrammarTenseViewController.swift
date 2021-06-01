import UIKit

class GrammarTenseViewController: UIViewController {

    @IBOutlet weak var tenseDescriptionTextView: UITextView!
    @IBOutlet weak var button: UIButton!
    
    //var tenseDescriptionInformation: Information!
    let tenseDescriptionInformation = Information()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tenseDescriptionTextView.text = tenseDescriptionInformation.label

    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("APPEARED")
        print(tenseDescriptionTextView.text)
        
    }
    
    
    @IBAction func tapped(_ sender: Any) {
        performSegue(withIdentifier: "toGrammarList", sender: self)
    }
    

}

class Information {
    public var label:String = "basic"
    init() {
        label = "basic"
    }
}
