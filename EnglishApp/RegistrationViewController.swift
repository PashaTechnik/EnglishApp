//
//  RegistrationViewController.swift
//  EnglishApp
//
//  Created by Pasha on 23.10.2020.
//  Copyright © 2020 Pasha. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {

    var user = User(name: "empty", email: "empty", password: "empty")
    
    
    
    @IBOutlet weak var ConfPasswordTextFieldReg: UITextField!
    @IBOutlet weak var PasswordTextFieldReg: UITextField!
    @IBOutlet weak var EmailTextFieldReg: UITextField!
    @IBOutlet weak var NameTextFieldReg: UITextField!
    
    @IBAction func RegisterBtn(_ sender: Any) {
        let password = PasswordTextFieldReg.text
        let email = EmailTextFieldReg.text
        let confPassword = ConfPasswordTextFieldReg.text
        let name = NameTextFieldReg.text
        
        user.email = email ?? "empty"
        user.name = name ?? "empty"
        user.password = password ?? "empty"
        
        if password == confPassword {
            
        }
        else {
            print("Registration Error")
        }
    }

    override func viewDidLoad() {
        ConfPasswordTextFieldReg.addDoneButtonOnKeyboard()
        PasswordTextFieldReg.addDoneButtonOnKeyboard()
        EmailTextFieldReg.addDoneButtonOnKeyboard()
        NameTextFieldReg.addDoneButtonOnKeyboard()
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "goToTest" else { return }
        guard let destination = segue.destination as? TestingViewController else { return }
        destination.user = user
        
    }

}
