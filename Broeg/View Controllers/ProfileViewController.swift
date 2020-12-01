//
//  ProfileViewController.swift
//  Broeg
//
//  Created by Rasmus Kjær Mortensen on 02/11/2020.
//

import UIKit
import Firebase
import FirebaseDatabase

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpElements()
        getUser()

        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    @IBOutlet weak var nameTxt: UITextField!
    
    
    @IBOutlet weak var lastNameLabel: UILabel!
    
    
    @IBOutlet weak var lastNameTxt: UITextField!
    
    
    @IBOutlet weak var emailLabel: UILabel!
    
    
    @IBOutlet weak var emailTxt: UITextField!
    
    
    @IBOutlet weak var saveBtn: UIButton!
    
    
    @IBAction func saveBtnTapped(_ sender: UIButton) {
    }
    
    func setUpElements() {
        Utilities.styleTextField(textfield: nameTxt)
        Utilities.styleTextField(textfield: lastNameTxt)
        Utilities.styleTextField(textfield: emailTxt)
        Utilities.styleFilledButton(button: saveBtn)
    }
    
    func getUser() {
        
        if Auth.auth().currentUser != nil {
            
            guard let uid = Auth.auth().currentUser?.uid else { return }
            
            Database.database().reference().child("users").child(uid).observeSingleEvent(of: .value) { (snapshot) in
                guard let dict = snapshot.value as? [String: Any] else { return }
                
                let user = currentUser(uid: uid, dictionary: dict)
                
                self.nameTxt.text = user.name
                self.lastNameTxt.text = user.lastName
                self.emailTxt.text = user.email                
            } withCancel: { (err) in
                print(err)
            }

            
        }
        
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
