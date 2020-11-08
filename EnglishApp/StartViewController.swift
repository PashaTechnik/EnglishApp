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
    var currentUser = User(name: "empty", email: "empty", password: "empty")

    @IBAction func goToAccountBtn(_ sender: Any) {
        Networking.fetchData{(users) in
                             self.users = users
                             for user in users {
                                 print(user)
                             }}
        for user in users {
            if user.isLoggedIn == true {
                currentUser = user
                self.performSegue(withIdentifier: "ShowTabBar", sender: self)
            }
        }
    }
    
    @IBAction func LogOutBtn(_ sender: Any) {
        
//        UserDefaults.standard.setValue(false, forKey: "isUserLoggedIn")
//        UserDefaults.standard.synchronize()
        Networking.fetchData{(users) in
                             self.users = users
                             for user in users {
                                 print(user)
                             }}
        for user in users {
            if user.isLoggedIn == true {
                currentUser = user
                currentUser.isLoggedIn = false
                Networking.updateUser(currentUser)
            }
        }
        
        self.performSegue(withIdentifier: "LoginView", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let vc = UIViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
        
        var currentUser: User
        Networking.fetchData{(users) in
                             self.users = users
                             for user in users {
                                 print(user)
                             }}
        for user in users {
            if user.isLoggedIn == true {
                currentUser = user

                self.performSegue(withIdentifier: "ShowTabBar", sender: self)
            }
        }
        
        

    }
    
    override func viewDidAppear(_ animated: Bool) {
//        var currentUser: User
        Networking.fetchData{(users) in
                             self.users = users
                             for user in users {
                                 print(user)
                             }}
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


    @IBAction func ResetPasswordBtn(_ sender: Any) {
        for user in users {
            if user.isLoggedIn == true {

                currentUser = user
                self.performSegue(withIdentifier: "toResetPassword", sender: self)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowTabBar" {
            guard segue.identifier == "ShowTabBar" else { return }
            let tabCtrl: UITabBarController = segue.destination as! UITabBarController
            let destinationVC = tabCtrl as! MainTabBar
            destinationVC.user = currentUser
        }
        
        if segue.identifier == "toResetPassword" {
            guard let destination = segue.destination as? ResetPasswordViewController else { return }
            destination.currentUser = currentUser
        }
        

    }
    
    



    

}


