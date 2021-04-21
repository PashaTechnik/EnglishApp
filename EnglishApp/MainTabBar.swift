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
    //var user = User(name: "Pasha", email: "Pasha@mail.ua", password: "1234", points: 7, isLoggedIn: true)

    @IBOutlet var networkManager: NetworkManager!
    
    public var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        DispatchQueue.main.async {
            self.fetchUser()
        }
    }
    
    func fetchUser(){
        networkManager.fetchData { [weak self] user in
            self?.user = user
        }
    }
}
