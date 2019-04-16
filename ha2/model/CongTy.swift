//
//  CongTy.swift
//  ha2
//
//  Created by vuminhtam on 4/13/19.
//  Copyright © 2019 Apple. All rights reserved.
//
import Foundation
import UIKit

struct CongTy {
    let idCT:String!
    let tencongty:String!
    let congviec:String!
    let diachi:String!
    
    init()
    {
        idCT = ""
        tencongty = ""
        congviec = ""
        diachi = ""
    }
    
    init(idCT:String,tencongty:String,congviec:String,diachi:String) {
        self.idCT = idCT
        self.tencongty = tencongty
        self.congviec = congviec
        self.diachi = diachi
    }
    
}
