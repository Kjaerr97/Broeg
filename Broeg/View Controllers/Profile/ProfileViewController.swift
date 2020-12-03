//
//  ProfileViewController.swift
//  Broeg
//
//  Created by Rasmus Kjær Mortensen on 02/11/2020.
//

import UIKit
import Firebase
import FirebaseAuth

class ProfileViewController: UIViewController

/**
 , firstNameDelegate, lastNameDelegate, emailDelegate
 */

{
    
    /*
    func firstNameData(Data: String) {
        firstName.text = Data
    }
    
    func lastNameData(Data: String) {
        lastName.text = Data
    }
    
    func emailData(Data: String) {
        yourEmail.text = Data
    }
 */
    
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showEditVC" {
            let editProfileViewController: editProfileViewController = segue.destination as! editProfileViewController
            editProfileViewController.firstNameDelegate = self
            editProfileViewController.lastNameDelegate = self
            editProfileViewController.emailDelegate = self
        }
    }
 */
 

    override func viewDidLoad() {
        super.viewDidLoad()
        getUser()

        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var yourEmail: UILabel!
    @IBOutlet weak var editInfoBtn: UIButton!
    @IBAction func editInfoBtnTapped(_ sender: UIButton) {
    }
    
    func getUser() {
        let user = Auth.auth().currentUser?.uid
        let db = Firestore.firestore()
        let ref = db.collection("users").document(user ?? "")
        ref.getDocument { (snapshot, err) in
            if let data = snapshot?.data() {
                
                guard let firstNameDb = data["firstname"] else {return}
                guard let lastNameDb = data["lastname"] else {return}
                guard let emailDb = data["email"] else {return}
                
                self.firstName.text = firstNameDb as? String
                self.lastName.text = lastNameDb as? String
                self.yourEmail.text = emailDb as? String

            } else {
                print("Couldn't fetch data")
            }
        }
    }
    
    @IBAction func unwindToProfileViewController(segue: UIStoryboardSegue) {
        
        getUser()
        
    }
    
}
