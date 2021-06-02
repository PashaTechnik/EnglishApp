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
       // performSegue(withIdentifier: "toGrammarList", sender: self)
        navigationController?.popViewController(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       let vc = segue.destination as! MainTabBar
       vc.nextVC = 4 // 4 is the tabbar number, tabbars start from 0.
   }

}

class Information {
    public var label:String = "basic"
    init() {
        label = "basic"
    }
}

