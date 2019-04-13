//
//  extention_function.swift
//  ha2
//
//  Created by vuminhtam on 4/13/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class chucnang{
    
    // dang xuat tai khoan hien tai
    func dangxuat()  {
        let firebaseAuth = Auth.auth()
        do {
            try
                firebaseAuth.signOut()
                User_flag = 0
            
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }



    
}
