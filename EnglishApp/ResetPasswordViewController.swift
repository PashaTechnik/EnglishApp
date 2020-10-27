


import UIKit

class ResetPasswordViewController: UIViewController {
    var users = [User]()
    var currentUser = User(name: "empty", email: "empty", password: "empty")
    
    @IBOutlet weak var currentPasswordField: UITextField!
    @IBOutlet weak var newPasswordField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField!
    
    @IBAction func resetBtn(_ sender: Any) {
        let currentPassword = currentPasswordField.text!
        let newPassword = newPasswordField.text!
        let confirmPassword = confirmPasswordField.text!
        
        if newPassword == confirmPassword {
            currentUser.password = newPassword
            Networking.resetPawword(currentUser)
            let alert = UIAlertController(title: "Success", message: "Password reset is successful!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
                self.dismiss(animated: true, completion: nil)
            }
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
        else {
            let alert = UIAlertController(title: "Error", message: "Passwords are not equal", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
                self.dismiss(animated: true, completion: nil)
            }
            alert.addAction(okAction)
            self.present(alert, animated: true)
            self.dismiss(animated: true, completion: nil)
        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        Networking.fetchData { (users) in
            self.users = users
        }

    }
    


}
