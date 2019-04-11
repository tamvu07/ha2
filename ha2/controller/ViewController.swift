//
//  ViewController.swift
//  ha2
//
//  Created by vuminhtam on 4/11/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var register: UIButton!
    @IBOutlet weak var login: UIButton!
    @IBOutlet weak var txt_email: UITextField!
    @IBOutlet weak var txt_pass: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        login.layer.cornerRadius = login.frame.width/2
        register.layer.borderColor = UIColor.blue.cgColor
        register.layer.borderWidth = 2
        register.layer.cornerRadius = 5
        register.contentEdgeInsets = UIEdgeInsets(top: 5,left: 5,bottom: 5,right: 5)
    }

    // button dang nhap
    @IBAction func bt_Login(_ sender: Any) {
        let email = txt_email.text
        let pass = txt_pass.text
        if(email == "" || pass == "")
        {
            let alert  = UIAlertController(title: "Thong bao", message: "Email hoac password chua nhap !", preferredStyle: .alert)
            let btn_ok:UIAlertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(btn_ok)
            present(alert, animated: true, completion: nil)
        }
        else
        {
           Auth.auth().signIn(withEmail: txt_email.text!, password: txt_pass.text!) { [weak self] user, error in
            if(error == nil)
            {
                print(".......dang nhap thanh cong ............")
            }
            else
            {

                // dang nhap khong thanh cong
                let alert = UIAlertController(title: "Thong Bao", message: "Email hoac password khong chinh xac", preferredStyle: .alert)
                let btn_ok:UIAlertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alert.addAction(btn_ok)
                self?.present(alert, animated: true, completion: nil)
                
            }
            }
        }

    }
    
    // button dang ky
    
    @IBAction func bt_dangky(_ sender: Any) {
        let scr = storyboard?.instantiateViewController(withIdentifier: "MH_dangky")
//        self.present(scr!, animated: true, completion: nil)
        navigationController?.pushViewController(scr!, animated: true)
    }
    

}

