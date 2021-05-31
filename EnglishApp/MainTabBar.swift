//
//  MainTabBar.swift
//  EnglishApp
//
//  Created by Pasha on 26.10.2020.
//  Copyright © 2020 Pasha. All rights reserved.
//

import UIKit

class MainTabBar: UITabBarController {

    @IBOutlet var networkManager: NetworkManager!
    
    public var user: User?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
