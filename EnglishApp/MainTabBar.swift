//
//  MainTabBar.swift
//  EnglishApp
//
//  Created by Pasha on 26.10.2020.
//  Copyright © 2020 Pasha. All rights reserved.
//

import UIKit

class MainTabBar: UITabBarController {
    //var user = User(name: "empty", email: "empty", password: "empty")
    var user = User(name: "Pasha", email: "Pasha@mail.ua", password: "1234", points: 7, isLoggedIn: true)

    override func viewDidLoad() {
        super.viewDidLoad()


        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
