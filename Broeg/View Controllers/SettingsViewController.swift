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
        setUpElements()
    }
    
    
    @IBOutlet weak var signOutOutlet: UIButton!
    @IBOutlet weak var deleteAccOutlet: UIButton!
    @IBAction func signOutBtn(_ sender: UIButton) {
        signOut()
    }
    
    @IBAction func deleteAccBtn(_ sender: UIButton) {
        deleteAcc()
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
    
    func deleteAcc() {
        let user = Auth.auth().currentUser?.uid
        let db = Firestore.firestore()
        db.collection("users").document(user ?? "").updateData([
            "firstname": FieldValue.delete(), "lastname": FieldValue.delete(), "email": FieldValue.delete(), "uid": FieldValue.delete()]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
            }
        }
        
        db.collection("users").document(user ?? "").delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
            } else {
                print("Document successfully removed!")
            }
        }
    }
    
    func setUpElements() {
        Utilities.styleFilledSignOutButton(button: signOutOutlet)
        Utilities.styleFilledDeleteButton(button: deleteAccOutlet)
    }
    }
