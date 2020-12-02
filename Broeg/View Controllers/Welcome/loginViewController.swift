//
//  loginViewController.swift
//  Broeg
//
//  Created by Rasmus Kjær Mortensen on 12/11/2020.
//

import UIKit
import FirebaseAuth
import Firebase

class loginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpElements()

        // Do any additional setup after loading the view.
    }
    
    func setUpElements() {
        
        // hide error label
        errorLabel.alpha = 0
        
        Utilities.styleTextField(textfield: emailTextField)
        Utilities.styleTextField(textfield: passwordTextField)
        Utilities.styleFilledButton(button: loginButton)
    }
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBAction func loginTapped(_ sender: Any) {
        
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, err) in
            
            if err != nil {
                // couldn't sign in
                self.errorLabel.text = err!.localizedDescription
                self.errorLabel.alpha = 1
            }
            
            else {
                let navigationController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.UINavigationController) as? UINavigationController
                
                self.view.window?.rootViewController = navigationController
                self.view.window?.makeKeyAndVisible()
            }
        }
    }
}
