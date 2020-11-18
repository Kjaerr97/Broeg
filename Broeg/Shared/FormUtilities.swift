//
//  File.swift
//  Broeg
//
//  Created by Rasmus Kjær Mortensen on 12/11/2020.
//

import Foundation

class FormUtilities {
    
    static func isPasswordValid(  password : String) -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@ ", "^(?=.*[a-z])(?=.*[$@$#!%*?&]).{6,}$")
        return passwordTest.evaluate(with: password)
    }

}
