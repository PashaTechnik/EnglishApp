//
//  StartViewController.swift
//  EnglishApp
//
//  Created by Pasha on 22.10.2020.
//  Copyright © 2020 Pasha. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    var users = [User]()

    @IBAction func LogOutBtn(_ sender: Any) {
        
        UserDefaults.standard.setValue(false, forKey: "isUserLoggedIn")
        UserDefaults.standard.synchronize()
        self.performSegue(withIdentifier: "LoginView", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var currentUser: User
        Networking.fetchData { (users) in
            self.users = users
        }
        print(users.count)
        for user in users {
            if user.isLoggedIn == true {
                currentUser = user
                self.performSegue(withIdentifier: "ShowTabBar", sender: self)
            }
        }
        

    }
    override func viewDidAppear(_ animated: Bool) {
//        var currentUser: User
        Networking.fetchData { (users) in
            self.users = users
        }
//
//
//        for user in users {
//            if user.isLoggedIn == true {
//                currentUser = user
//                self.performSegue(withIdentifier: "ShowTabBar", sender: self)
//            }
//        }
        
        
//        let isUserLoggedIn = UserDefaults.standard.bool(forKey: "isUserLoggedIn")
//
//        if !isUserLoggedIn {
//            self.performSegue(withIdentifier: "LoginView", sender: self)
//        }
    
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard segue.identifier == "ShowTabBar" else { return }
//        guard let destination = segue.destination as? TestingViewController else { return }
//        destination.user = self.user
//
//    }

    

}
