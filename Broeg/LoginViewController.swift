//
//  LoginViewController.swift
//  Broeg
//
//  Created by Rasmus Kjær Mortensen on 08/11/2020.
//

import UIKit
import FirebaseAuth
import Firebase

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBOutlet var textEmail2: UITextField!
    
    
    @IBOutlet var textPassword2: UITextField!
    
    
    @IBAction func btnLogin(_ sender: UIButton) {
        validateFields()
    }
    
    func validateFields() {
        if textEmail2.text?.isEmpty == true {
            print("No email input")
            return
        }
        
        if textPassword2.text?.isEmpty == true {
            print("No password input")
            return
        }
        
        login()
        
    }
    
    func login() {
        Auth.auth().signIn(withEmail: textEmail2.text!, password: textPassword2.text!) { [weak self] authResult, err in
            guard self != nil else {return}
            if let err = err {
                print(err.localizedDescription)
            }
            self!.checkUserInfo()
        }
        
    }
    
    func checkUserInfo() {
        if Auth.auth().currentUser != nil {
            print(Auth.auth().currentUser?.uid)
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "home")
            vc.modalPresentationStyle = .overFullScreen
            present(vc, animated: true)
        }
        
    }
    
    @IBAction func btnCreateAcc(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "signUp")
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
