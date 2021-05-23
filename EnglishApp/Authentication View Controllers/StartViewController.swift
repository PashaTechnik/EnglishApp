//
//  StartViewController.swift
//  EnglishApp
//
//  Created by Pasha on 15.04.2021.
//  Copyright © 2021 Pasha. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var logInBtn: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpElements()
    }
    
    func setUpElements() {
//        Utilities.styleFilledButton(signUpBtn)
//        Utilities.styleHollowButton(logInBtn)
        signUpBtn.layer.cornerRadius = 10
        signUpBtn.clipsToBounds = true
    }
    
}

