//
//  editProfileViewController.swift
//  Broeg
//
//  Created by Rasmus Kjær Mortensen on 02/12/2020.
//

import UIKit
import Firebase
import FirebaseAuth

protocol firstNameDelegate {
    func firstNameData(Data: String)
}

protocol lastNameDelegate {
    func lastNameData(Data: String)
}

protocol emailDelegate {
    func emailData(Data: String)
}

class editProfileViewController: UIViewController {
    
    var firstNameDelegate: firstNameDelegate? = nil
    var lastNameDelegate: lastNameDelegate? = nil
    var emailDelegate: emailDelegate? = nil
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var firstNameTxt: UITextField!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var lastNameTxt: UITextField!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var saveBtn: UIButton!
    @IBAction func saveBtnTapped(_ sender: UIButton) {
        updateProfile()
        
    }
    
    func updateProfile () {
        if firstNameDelegate != nil {
            if firstNameTxt.text != nil {
                let data = firstNameTxt.text
                firstNameDelegate?.firstNameData(Data: data!)
            }
        }
        
        if lastNameDelegate != nil {
            if lastNameTxt.text != nil {
                let data = lastNameTxt.text
                lastNameDelegate?.lastNameData(Data: data!)
            }
        }
        
        if emailDelegate != nil {
            if emailTxt.text != nil {
                let data = emailTxt.text
                emailDelegate?.emailData(Data: data!)
            }
        }
        
        // update firestore with text
        let user = Auth.auth().currentUser?.uid
        let db = Firestore.firestore()
        db.collection("users").document(user ?? "").setData(["firstname":firstNameTxt.text!, "lastname":lastNameTxt.text!,"email":emailTxt.text!, "uid":user!])
    }
}
