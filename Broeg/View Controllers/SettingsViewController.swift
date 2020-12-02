//
//  SettingsViewController.swift
//  Broeg
//
//  Created by Rasmus Kjær Mortensen on 01/12/2020.
//

import UIKit
import Firebase
import FirebaseAuth

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func singOutBtnTapped(_ sender: UIButton) {
        
        signOut()
        
    }
    
    
    @IBAction func deleteBtnTapped(_ sender: UIButton) {
    }
    
    func signOut() {
        
        do {
            try Auth.auth().signOut()
            
            let welcomeController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.welcomeViewController) as? welcomeViewController
            self.view.window?.rootViewController = welcomeController
            self.view.window?.makeKeyAndVisible()
            
        } catch let err {
                print(err)
            }
            
        }
        
    }
