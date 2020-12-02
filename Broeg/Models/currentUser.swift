//
//  currentUser.swift
//  Broeg
//
//  Created by Rasmus Kjær Mortensen on 30/11/2020.
//

import Foundation

struct currentUser {
    
    let uid: String
    let name: String
    let lastName: String
    let email: String
    
    init(uid: String, dictionary: [String: Any]) {
        
        self.uid = uid
        self.name = dictionary["name"] as? String ?? ""
        self.lastName = dictionary["lastname"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
    }
    
}
