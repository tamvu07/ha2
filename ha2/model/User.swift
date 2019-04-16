//
//  User.swift
//  ha2
//
//  Created by vuminhtam on 4/12/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import UIKit

struct User {
    let id:String!
    let email:String!
    var Avatar:UIImage!
    
    init()
    {
        id = ""
        email = ""
        Avatar = UIImage(named: "person")
    }
    
    init(id:String,email:String) {
        self.id = id
        self.email = email
        self.Avatar = UIImage(named: "person")
    }
    
}
