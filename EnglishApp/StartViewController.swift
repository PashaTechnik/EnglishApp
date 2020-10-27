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
        fetchData()
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
        fetchData()
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
        fetchData()
        for user in users {
            if user.isLoggedIn == true {
                currentUser = user

                self.performSegue(withIdentifier: "ShowTabBar", sender: self)
            }
        }
        
        

    }
    
    override func viewDidAppear(_ animated: Bool) {
//        var currentUser: User
        fetchData()
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
    func fetchData(){
        guard let url = URL(string: "http://localhost:8080/users") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data else {
                print(error?.localizedDescription ?? "Unknown error")
                return
            }
            
            let decoder = JSONDecoder()
            
            if let users = try? decoder.decode([User].self, from: data) {
                DispatchQueue.main.async {
                     self.users = users
                     print("Loaded \(users.count) users.")
                 }
                } else {
                    print("Unable to parse JSON response.")
                }
        }.resume()
    }

    @IBAction func ResetPasswordBtn(_ sender: Any) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "ShowTabBar" else { return }
        let tabCtrl: UITabBarController = segue.destination as! UITabBarController
        let destinationVC = tabCtrl as! MainTabBar
        
        //guard let destination = segue.destination as? TestingViewController else { return }
        
        destinationVC.user = currentUser

    }

    

}


