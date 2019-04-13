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
    
    func kiemtradangnhap() -> Int
    {
        var a = 2
        // kiem tra nguoi dung dang nhap chua ?
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if user != nil
            {
                // da dang nhap
                print("......\(user?.email).........")
                a = 1
            }
            else
            {
//                print("chua dang nhap !..........")
                a = 0
            }
        }
        return a
    }
    
    // dang xuat tai khoan hien tai
    func dangxuat()  {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }



    
}
