import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var userLevel_label: UILabel!
    @IBOutlet weak var userPhoto: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tabBar = tabBarController as! MainTabBar
        userLevel_label.text = String(tabBar.user.points)
        usernameLabel.text = tabBar.user.name
    }
    
    override func viewDidAppear(_ animated: Bool) {

    }

}
