import UIKit

class MainTabBar: UITabBarController {

    @IBOutlet var networkManager: NetworkManager!
    
    public var user: User?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBar.appearance().barTintColor = UIColor.white
        UITabBar.appearance().isTranslucent = false
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Montserrat-Medium", size: 10)!], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Montserrat-Medium", size: 10)!], for: .selected)
        
        if let items = tabBar.items {
                    for item in items {
                        item.setTitleTextAttributes([.foregroundColor: UIColor(red: 55.0/255.0, green: 55/255.0, blue: 55/255.0, alpha: 1)], for: .selected)
                        item.setTitleTextAttributes([.foregroundColor: UIColor(red: 55/255.0, green: 55/255.0, blue: 55/255.0, alpha: 1)], for: .normal)
                        item.image?.withTintColor(UIColor(red: 55.0/255.0, green: 55/255.0, blue: 55/255.0, alpha: 1))
                    }
                }
        
        self.tabBar.unselectedItemTintColor = UIColor(red: 55.0/255.0, green: 55/255.0, blue: 55/255.0, alpha: 1.0)
        



        DispatchQueue.main.async {
            self.fetchUser()
//            StorageManager.clearDatabase()
//            StorageManager.saveQuestions()
//            StorageManager.saveTranslate()
//            StorageManager.saveTranslateQuiz()
        }
    }
    
    func fetchUser(){
        networkManager.fetchData { [weak self] user in
            self?.user = user
        }
    }
}
