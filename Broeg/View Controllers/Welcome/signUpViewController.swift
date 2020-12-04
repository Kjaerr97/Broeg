//
//  signUpViewController.swift
//  Broeg
//
//  Created by Rasmus Kjær Mortensen on 12/11/2020.
//

import UIKit
import FirebaseAuth
import Firebase

class signUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpElements()

        // Do any additional setup after loading the view.
    }
    
    func setUpElements() {
        
        // hide error label from screen
        errorLabel.alpha = 0
        
        Utilities.styleTextField(textfield: firstNameTextField)
        Utilities.styleTextField(textfield: lastNameTextField)
        Utilities.styleTextField(textfield: emailTextField)
        Utilities.styleTextField(textfield: passwordTextField)
        Utilities.styleFilledButton(button: signUpButton)
    }
    
    
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    // outlet for at designe knappen
    @IBOutlet weak var signUpButton: UIButton!
    
    
    @IBOutlet weak var errorLabel: UILabel!
    
    // "-> String?" = returning an optinal string
    // check fields and validate that the data is correct
    // this method returns nil if it's correct, otherwise an error message as a string
    func validateFields() -> String? {
        
        // måske lave en samlet fil med alle sådan definitioner
        let email = emailTextField.text!
        let password = passwordTextField.text!
        let firstName = firstNameTextField.text!
        let lastName = lastNameTextField.text!
        
        // check that all fields are filled in
        if email.isEmpty || password.isEmpty || firstName.isEmpty || lastName.isEmpty {
            return "Please fill in all fields."
        }
        
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(password: cleanedPassword) == false {
            
            // password isn't secure enough
            
            return "Please make sure your password is at least 8 characters, contains a special character and a number."
            
            
        }
        return nil
    }
    
    
    
    @IBAction func signUpTapped(_ sender: UIButton) {
        let error = validateFields()
        if error != nil {
            // there was an error, show error message
            showError(message: error!)
        }
        
        else {
            // create cleaned versions of the data
            let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let emailText = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let passwordText = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // create user
            Auth.auth().createUser(withEmail: emailText, password: passwordText) { (result, err) in
                
                // check for errors
                if err != nil {
                    //there was an error creating the user
                    self.showError(message: "Error creating user")
                }
                
                else {
                    // user was creating succesfully, now store the first name and last name
                    let db = Firestore.firestore()
                    db.collection("users").document(result!.user.uid).setData(["firstname":firstName, "lastname":lastName, "email":emailText, "uid": result!.user.uid]) { (error) in
                        
                        if error != nil {
                            // show error message
                            self.showError(message: "User data couldn't be saved in the database")
                        }
                    }
                    
                    // transition to homescreen
                    self.transitionToHome()
                }
            }
        }
    }
    
    func showError(  message:String) {
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    // using file "Constants"
    func transitionToHome() {
        let navigationController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.UINavigationController) as? UINavigationController
        
        self.view.window?.rootViewController = navigationController
        self.view.window?.makeKeyAndVisible()
    }
    
}
