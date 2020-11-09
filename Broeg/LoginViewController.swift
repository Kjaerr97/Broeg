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
