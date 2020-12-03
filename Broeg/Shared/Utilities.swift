//
//  Utilities.swift
//  Broeg
//
//  Created by Rasmus Kjær Mortensen on 18/11/2020.
//
// this file is for designing textfields and buttons

import Foundation
import UIKit

class Utilities {
    
    static func styleTextField(  textfield: UITextField) {
        
        let buttomLine = CALayer()
        
        buttomLine.frame = CGRect(x: 0,y: textfield.frame.height - 2, width: textfield.frame.width, height: 2)
        
        buttomLine.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1).cgColor
        
        // remove border on textfield
        textfield.borderStyle = .none
        
        // add line to the textfield
        textfield.layer.addSublayer(buttomLine)
        
    }
    
    static func styleFilledButton(  button: UIButton) {
        
        // filled rounded corner style
        button.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1)
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.white
        
    }
    
    static func styleFilledDeleteButton(  button: UIButton) {
        
        // filled rounded corner style
        button.backgroundColor = UIColor.red
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.white
        
    }
    
    static func styleFilledHomeButton(  button: UIButton) {
        
        // filled rounded corner style
        button.backgroundColor = UIColor.brown
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.white
        
    }
    
    static func styleFilledSignOutButton(  button: UIButton) {
        
        // filled rounded corner style
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.white
        button.backgroundColor = UIColor.orange
        
    }
    
    
    static func stylHollowButton(  button: UIButton) {
        
        // hollow rounded corner style
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.black
        
    }
    
    static func isPasswordValid(  password : String) -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@ ", "^(?=.*[a-z])(?=.*[$@$#!%*?&]).{6,}$")
        return passwordTest.evaluate(with: password)
    }
    
}

