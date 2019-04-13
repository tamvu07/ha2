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
    let pass:String!
    
    init()
    {
        id = ""
        email = ""
        pass = ""
    }
    
    init(id:String,email:String,pass:String) {
        self.id = id
        self.email = email
        self.pass = pass
    }
    
}
