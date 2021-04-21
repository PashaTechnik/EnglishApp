import UIKit
import Firebase

class ProfileViewController: UIViewController {
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var userLevel_label: UILabel!
    @IBOutlet weak var userPhoto: UIImageView!
    
    
    @IBOutlet weak var levelTextLabel: UILabel!
    @IBOutlet weak var progressBarImage: UIImageView!
    @IBOutlet weak var pointsTextLabel: UILabel!
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tabbar = tabBarController as! MainTabBar
        user = tabbar.user
        
        initUser(user ?? User(firstName: "", lastName: "", email: "", points: 0, dictionary: [:]))
    }

    
    override func viewDidAppear(_ animated: Bool) {
        initUser(user ?? User(firstName: "", lastName: "", email: "", points: 0, dictionary: [:]))
    }
    
    func initUser(_ user: User){
        userLevel_label.text = getLevel(user.points).0
        levelTextLabel.text = String(getLevel(user.points).1) + " Level"
        usernameLabel.text = user.firstName
        var currentPoints = (user.points * 100) % 300
        let toGoalPoint = 300
        pointsTextLabel.text = String(currentPoints) + "/" + String(toGoalPoint)
        progressBarImage.image = getProgressBar(currentP: currentPoints, goalP: toGoalPoint)
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
    
    func getProgressBar(currentP:Int, goalP:Int) -> UIImage {
        
        let percents = (currentP/goalP) * 100
        
        switch percents {
        case 0..<20:
            return UIImage(named: "progress20")!
        case 20..<40:
            return UIImage(named: "progress40")!
        case 40..<60:
            return UIImage(named: "progress60")!
        case 60..<80:
            return UIImage(named: "progress80")!
        default:
            return UIImage(named: "progress100")!
        }
    }
    
    @IBAction func logout(_ sender: Any) {
        do{
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
        
    }
    
}
