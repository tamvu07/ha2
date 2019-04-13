//
//  MH_Trang_Chu_ViewController.swift
//  ha2
//
//  Created by vuminhtam on 4/12/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
var vistor:User!
var User_flag:Int!
var User_name:String!

class MH_Trang_Chu_ViewController: UIViewController {

    let f = chucnang()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(User_flag != 1)
        {
            f.dangxuat()
        }
        
//        bt_menu.target = self.revealViewController()
//        bt_menu.action = Selector("revealToggle:")
//        self.view.addGestureRecognizer((self.revealViewController()?.panGestureRecognizer())!)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
