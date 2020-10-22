//
//  StartViewController.swift
//  EnglishApp
//
//  Created by Pasha on 22.10.2020.
//  Copyright © 2020 Pasha. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewDidAppear(_ animated: Bool) {
        self.performSegue(withIdentifier: "LoginView", sender: self)
    }
    

}
