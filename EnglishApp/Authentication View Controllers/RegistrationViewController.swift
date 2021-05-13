//
//  RegistrationViewController.swift
//  EnglishApp
//
//  Created by Pasha on 15.04.2021.
//  Copyright © 2021 Pasha. All rights reserved.
//

import UIKit
import Firebase

class RegistrationViewController: UIViewController {

    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        firstNameField.addDoneButtonOnKeyboard()
        lastNameField.addDoneButtonOnKeyboard()
        emailField.addDoneButtonOnKeyboard()
        passwordField.addDoneButtonOnKeyboard()

        setUpElements()
        // Do any additional setup after loading the view.
    }
    
    func setUpElements() {
    
        // Hide the error label
        errorLabel.alpha = 0
    
        // Style the elements
        Utilities.styleTextField(firstNameField)
        Utilities.styleTextField(lastNameField)
        Utilities.styleTextField(emailField)
        Utilities.styleTextField(passwordField)
        Utilities.styleFilledButton(signUpBtn)
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        

        
        // Validate the fields
        let error = validateFields()
        
        if error != nil {
            
            // There's something wrong with the fields, show error message
            showError(error!)
        }
        else {
            
            // Create cleaned versions of the data
            let firstName = firstNameField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastNameField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // Create the user
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                
                // Check for errors
                if err != nil {
                    
                    // There was an error creating the user
                    //self.showError("Error creating user")
                    self.showError("\(String(describing: err?.localizedDescription))")
                }
                else {
                    
                    // User was created successfully, now store the first name and last name
                    let db = Firestore.firestore()
                    
                    db.collection("users").addDocument(data: ["Dictionary":[:],"firstname":firstName, "lastname":lastName,"points":0, "uid": result!.user.uid ]) { (error) in
                        
                        if error != nil {
                            // Show error message
                            self.showError("Error saving user data")
                        }
                    }
                    
                    // Transition to the home screen
                    self.transitionToHome()
                }
            }
        }
    }
    
    func showError(_ message:String) {
        errorLabel.text = message
        errorLabel.alpha = 1
    }
        
    func transitionToHome() {
            
        let profileViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.mainTabBar) as? MainTabBar
        
        self.view.window?.rootViewController = profileViewController
        self.view.window?.makeKeyAndVisible()
    }
    
    func validateFields() -> String? {
        
        // Check that all fields are filled in
        if firstNameField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastNameField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in all fields."
        }
        
        // Check if the password is secure
        //let cleanedPassword = passwordField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
//        if Utilities.isPasswordValid(cleanedPassword) == false {
//            // Password isn't secure enough
//            return "Please make sure your password is at least 8 characters, contains a special character and a number."
//        }
        
        return nil
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
