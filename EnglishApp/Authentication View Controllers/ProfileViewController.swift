import UIKit
import Firebase

class ProfileViewController: UIViewController {
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var userLevel_label: UILabel!
    @IBOutlet weak var userPhoto: UIImageView!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var levelTextLabel: UILabel!
    @IBOutlet weak var pointsTextLabel: UILabel!
    
    var user: User?
    var defaultUser = User(firstName: "", lastName: "", email: "", points: 0, dictionary: [:])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tabbar = tabBarController as! MainTabBar
        user = tabbar.user
        
        initUser(user ?? defaultUser)
        progressBar.transform = progressBar.transform.scaledBy(x: 1, y: 8)
        progressBar.layer.cornerRadius = 10
        progressBar.clipsToBounds = true
        progressBar.layer.sublayers![1].cornerRadius = 10
        progressBar.subviews[1].clipsToBounds = true
    }

    
    override func viewDidAppear(_ animated: Bool) {
        initUser(user ?? defaultUser)
    }
    
    func initUser(_ user: User){
        userLevel_label.text = getLevel(user.points).0
        levelTextLabel.text = String(getLevel(user.points).1) + " Level"
        usernameLabel.text = user.firstName
        let currentPoints = user.points
        let toGoalPoint = 300
        pointsTextLabel.text = String(currentPoints) + "/" + String(toGoalPoint)
        progressBar.progress = Float(user.points)
    }
    
    
    func getLevel(_ points: Int) -> (String,Int){
        var englishLevel: String
        var englishLevelNum: Int
        
        switch points {
        case 0..<3:
            englishLevel = "Beginner"
            englishLevelNum = 1
        case 3..<6:
            englishLevel = "Elementary"
            englishLevelNum = 2
        case 6..<9:
            englishLevel = "Intermediate"
            englishLevelNum = 3
        case 9..<12:
            englishLevel = "Upper Intermediate"
            englishLevelNum = 4
        default:
            englishLevel = "Advanced"
            englishLevelNum = 5
        }
        
        return (englishLevel,englishLevelNum)
    }
    
    
    @IBAction func logout(_ sender: Any) {
        do{
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
        
    }
    
}
