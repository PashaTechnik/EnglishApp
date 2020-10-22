//
//  RegistrationViewController.swift
//  EnglishApp
//
//  Created by Pasha on 23.10.2020.
//  Copyright © 2020 Pasha. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    @IBOutlet weak var ConfPasswordTextFieldReg: UITextField!
    @IBOutlet weak var PasswordTextFieldReg: UITextField!
    @IBOutlet weak var EmailTextFieldReg: UITextField!
    
    @IBAction func RegisterBtn(_ sender: Any) {
        let password = PasswordTextFieldReg.text
        let email = EmailTextFieldReg.text
        let confPassword = ConfPasswordTextFieldReg.text
        
        let user = User(email: email ?? "empty", password: password ?? "empty")
        
        if password == confPassword {
            addUser(user)
        }

        print("Registration Error")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func addUser(_ user: User){
        let nUser = User(email: user.email, password: user.password)
        let url = URL(string: "http://localhost:8080/users")!

        let encoder = JSONEncoder()

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? encoder.encode(nUser)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()

                if let item = try? decoder.decode(User.self, from: data) {
                    print(item.email)
                } else {
                    print("Bad JSON received back.")
                }
            }
        }.resume()
    }

}
