//
//  SignupViewController.swift
//  Broeg
//
//  Created by Rasmus Kjær Mortensen on 09/11/2020.
//

import UIKit
import FirebaseAuth
import Firebase

class SignupViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet var textEmail: UITextField!
    
    
    @IBOutlet var textPassword: UITextField!
    
    
    
    
    @IBAction func bntSignUp(_ sender: UIButton) {
        
        if textEmail.text?.isEmpty == true {
            print("No text in Email field")
            return
        }
        
        if textPassword.text?.isEmpty == true {
            print("No text in Password field")
            return
        }
        
        signUp()
        
    }
    
    
    
    func signUp() {
        Auth.auth().createUser(withEmail: textEmail.text!, password: textPassword.text!) { (authResult, error) in
            guard let user = authResult?.user, error == nil else {
                print("Error \(error?.localizedDescription)")
                return
            }
        }
        
        /**
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "home")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
        */
        
        performSegue(withIdentifier: "signUpPressed", sender: self)
        
    }
    
    
    @IBAction func btnAlrAccount(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "login")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
