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
        
        
        
    }
    
    @IBOutlet weak var emailTextField: UITextField!
    
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    @IBOutlet weak var loginButton: UIButton!
    
    
    
    @IBOutlet weak var errorLabel: UILabel!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func loginTapped(_ sender: Any) {
        
        /*
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        if password.isEmpty || email.isEmpty {
            
        }
 */
        
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
