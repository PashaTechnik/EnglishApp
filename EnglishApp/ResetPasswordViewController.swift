


import UIKit

class ResetPasswordViewController: UIViewController {
    var users = [User]()
    
    @IBOutlet weak var currentPasswordField: UITextField!
    @IBOutlet weak var newPasswordField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField!
    
    @IBAction func resetBtn(_ sender: Any) {
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        Networking.fetchData { (users) in
            self.users = users
        }

    }
    


}
