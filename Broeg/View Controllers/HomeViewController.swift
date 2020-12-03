//
//  ViewController.swift
//  Broeg
//
//  Created by Rasmus Kjær Mortensen on 29/10/2020.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var broegBtnOutlet: UIButton!
    
    
    @IBOutlet weak var historikBtnOutlet: UIButton!
    
    
    @IBOutlet weak var rensBtnOutlet: UIButton!
    
    func setUpElements() {
        
        Utilities.styleFilledHomeButton(button: broegBtnOutlet)
        Utilities.styleFilledHomeButton(button: historikBtnOutlet)
        Utilities.styleFilledHomeButton(button: rensBtnOutlet)
        
    }
    
    @IBAction func unwindToHomeViewController(segue: UIStoryboardSegue) {
    }
    
}
