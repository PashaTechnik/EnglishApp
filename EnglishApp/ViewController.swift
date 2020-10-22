//
//  ViewController.swift
//  EnglishApp
//
//  Created by Pasha on 09.10.2020.
//  Copyright © 2020 Pasha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var users = [User]()

    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!

    @IBAction func LoginBtn(_ sender: Any) {
        let user = User(email: EmailTextField.text ?? "empty", password: PasswordTextField.text ?? "empty")

        addUser(user)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()


        fetchData()
    }
    func fetchData(){
        guard let url = URL(string: "http://localhost:8080/galaxies") else { return }
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



extension UITextField{
    
    @IBInspectable var doneAccessory: Bool{
        get{
            return self.doneAccessory
        }
        set (hasDone) {
            if hasDone{
                addDoneButtonOnKeyboard()
            }
        }
    }
    
    func addDoneButtonOnKeyboard()
    {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))
        
        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        self.inputAccessoryView = doneToolbar
    }
    
    @objc func doneButtonAction()
    {
        self.resignFirstResponder()
    }
}


