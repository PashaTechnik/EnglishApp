//
//  StartViewController.swift
//  EnglishApp
//
//  Created by Pasha on 22.10.2020.
//  Copyright © 2020 Pasha. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    @IBAction func LogOutBtn(_ sender: Any) {
        
        UserDefaults.standard.setValue(false, forKey: "isUserLoggedIn")
        UserDefaults.standard.synchronize()
        self.performSegue(withIdentifier: "LoginView", sender: self)
    }
    override func viewDidLoad() {
        print(UserDefaults.standard.bool(forKey: "isUserLoggedIn"))
        super.viewDidLoad()
        

    }
    override func viewDidAppear(_ animated: Bool) {
        let isUserLoggedIn = UserDefaults.standard.bool(forKey: "isUserLoggedIn")
        if !isUserLoggedIn {
            self.performSegue(withIdentifier: "LoginView", sender: self)
        }
    
    }
    

}
