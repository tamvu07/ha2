//
//  DangKy_ViewController.swift
//  ha2
//
//  Created by vuminhtam on 4/11/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseStorage

class DangKy_ViewController: UIViewController {

    @IBOutlet weak var txt_email: UITextField!
    
    @IBOutlet weak var txt_pass: UITextField!
    
    @IBOutlet weak var txt_repass: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func bt_dangky(_ sender: Any) {
        let email:String = txt_email.text!
        let pass:String = txt_pass.text!
        let repass:String = txt_repass.text!
        
        if(email == "" || pass == "" || repass == "")
        {
            let alert = UIAlertController(title: "Thông Báo", message: "Vui Lòng Nhập Đủ Thông Tin", preferredStyle: .alert)
            let bt_ok:UIAlertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(bt_ok)
            self.present(alert, animated: true, completion: nil)
        }
        else
        {
        // tao tai khoan
        Auth.auth().createUser(withEmail: email, password: pass) { authResult, error in
            if(error == nil)
            {
                // dang ky xong ma ko co loi thi cho dang nhap luon
                Auth.auth().signIn(withEmail: email, password: pass) { (user, error) in
                    if(error == nil)
                    {
                        let alert = UIAlertController(title: "Thông Báo", message: "Đăng ký thành công", preferredStyle: .alert)
                        let bt_ok:UIAlertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        alert.addAction(bt_ok)
                        self.present(alert, animated: true, completion: nil)
                        
                        
                    }
                    
                }
//                        // cah de luu ten firebase
//                        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
//                        changeRequest?.commitChanges { (error) in
//                            if let error = error{
//                                print("loi upload profile")
//                            }else{
//                                //                                print("dang ky thanh cong ...... chuyen trang ! ")
//                            }
//                        }
            }
            else
            {
               let alert = UIAlertController(title: "Thông Báo", message: "Lỗi Đăng Ký", preferredStyle: .alert)
                let bt_ok:UIAlertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alert.addAction(bt_ok)
                self.present(alert, animated: true, completion: nil)
            }
        }
      }
    }
    


}