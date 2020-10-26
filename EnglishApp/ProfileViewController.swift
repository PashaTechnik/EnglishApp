import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var userLevel_label: UILabel!
    @IBOutlet weak var userPhoto: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userLevel_label.text = nil
    }
    
    override func viewDidAppear(_ animated: Bool) {
       // userLevel_label.text = levelShow()
    }

}
