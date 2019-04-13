//
//  MH_Chuyen_Menu_ViewController.swift
//  ha2
//
//  Created by vuminhtam on 4/12/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import Firebase

class MH_Chuyen_Menu_ViewController:  UIViewController, UITableViewDataSource,UITableViewDelegate{

    
    @IBOutlet weak var table_menu: UITableView!
    var arrCell:[String] = ["one","two"]
    let f = chucnang()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table_menu.delegate = self
        table_menu.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table_menu.dequeueReusableCell(withIdentifier: arrCell[indexPath.row], for: indexPath)
//        cell.textLabel?.text = arrCell[indexPath.row]
        if(arrCell[indexPath.row] == "one")
        {
             cell.textLabel?.text = "Đăng Nhập"
        }
        else if(arrCell[indexPath.row] == "two")
        {
            cell.textLabel?.text = "Hồ sơ của tôi"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row == 1)
        {
//            var a = 0
//            // khi bam vao thi xoay xoay
////            let alertActivity:UIAlertController = UIAlertController(title: "", message: "", preferredStyle: .alert)
////            let activity:UIActivityIndicatorView = UIActivityIndicatorView(style: .whiteLarge)
////            activity.frame = CGRect(x: (view.frame.size.width/2), y: 10, width: 0, height: 0)
////            activity.color = UIColor.red
////            alertActivity.view.addSubview(activity)
////            activity.startAnimating()
////            self.present(alertActivity, animated: true, completion: nil)
//            a = f.kiemtradangnhap()
//
//            if(a == 1)
//            {
////                // tat xoay xoay
////                activity.stopAnimating()
////                alertActivity.dismiss(animated: true, completion: nil)
//                // dang nhap thanh cong se chuyen man hinh
//                print(",,,,,,,,,\(a)>>>>>>>>>>")
//               self.goto_MH_hosocuatoi()
//
//            }else if(a == 0) {
////                // tat xoay xoay
////                activity.stopAnimating()
////                alertActivity.dismiss(animated: true, completion: nil)
//               // chua dang nhap
//                 print(",,,,,,,,,\(a)>,,,,,,,,,,,,,,,,,>>>>>>>>>")
//                self.goto_MH_dangnhap()
//            }
            
            // kiem tra nguoi dung dang nhap chua ?
            if(User_flag == 1)
            {
                self.goto_MH_hosocuatoi()
            }
            else if(User_flag != 1)
            {
                self.goto_MH_dangnhap()
            }
            
        }
    }
    
    func goto_MH_hosocuatoi()
    {
        let scr = storyboard?.instantiateViewController(withIdentifier: "MH_HoSoCuaTui")
        navigationController?.pushViewController(scr!, animated: true)
    }
    
    func goto_MH_dangnhap()
    {
        let scr = storyboard?.instantiateViewController(withIdentifier: "MH_dangnhap")
        navigationController?.pushViewController(scr!, animated: true)
    }
    
}
