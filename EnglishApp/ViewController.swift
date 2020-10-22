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

        let password = PasswordTextField.text
        let email = EmailTextField.text
        
        var enter = false
        
        for user in users {
            
            print(user.email)
            print(user.password)
            print(email!)
            print(password!)
        
            
            if user.password == password! && user.email == email! {
                enter = true
            }
        }
        if enter {
            let alert = UIAlertController(title: "Success", message: "Login is successful!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
                self.dismiss(animated: true, completion: nil)
            }
            
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
        else {
            let alert = UIAlertController(title: "Error", message: "Login is not successful!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
                self.dismiss(animated: true, completion: nil)
            }
            alert.addAction(okAction)
            self.present(alert, animated: true)
            return
        }
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        //self.performSegue(withIdentifier: "LoginView", sender: self)
        fetchData()
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        

        fetchData()
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


