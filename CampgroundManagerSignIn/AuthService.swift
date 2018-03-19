//
//  AuthService.swift
//  CampgroundManagerSignIn
//
//  Created by Robert Wais on 3/19/18.
//  Copyright © 2018 Robert Wais. All rights reserved.
//

import Foundation

import Foundation
import Firebase
import FirebaseStorage


class AuthService {
    
    static let instance = AuthService()
    
    func registerUser(email: String, password:String, role: String ,complete: @escaping (_ status: Bool, _ error: Error?) -> ()){
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            guard let user = user else {
                complete(false,error)
                return
            }
            let userData = ["provider": user.providerID, "email": user.email]
            DataService.instance.createDBUser(uniqueID: user.uid, userData: userData)
            DB_BASE.child("users").child(user.uid).updateChildValues(["role" : role])
            
            //Note on retrieving data
           /* DB_BASE.child("users").child((user?.uid)!).child("role").observe(DataEventType.value){ (data) in
                var val = data.value as? String
                print("Val: \(val)")
            }
            */
            complete(true,nil)
        }
    }
}
