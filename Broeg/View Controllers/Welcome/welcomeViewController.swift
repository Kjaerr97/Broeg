//
//  welcomeViewController.swift
//  Broeg
//
//  Created by Rasmus Kjær Mortensen on 12/11/2020.
//

import UIKit

class welcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpElements()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!
    
    func setUpElements () {
        
        Utilities.styleFilledButton(button: signUpButton)
        Utilities.styleFilledButton(button: loginButton)
        
    }
    
    @IBAction func unwindToWelcomeViewController(segue: UIStoryboardSegue) {
    }
    

}
