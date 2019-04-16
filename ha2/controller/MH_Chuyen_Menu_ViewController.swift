//
//  MH_Chuyen_Menu_ViewController.swift
//  ha2
//
//  Created by vuminhtam on 4/12/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import Firebase

// dua du lieu vao hco user
var currenUser:User!

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
        if(arrCell[indexPath.row] == "one")
        {
            if(User_flag == 1)
            {
                cell.textLabel?.text = "Đăng Xuất"
                cell.detailTextLabel?.text = User_name
            }else if(User_flag != 1)
            {
                cell.textLabel?.text = "Đăng Nhập"
                cell.detailTextLabel?.text = ". . ."
            }
            
        }
        else if(arrCell[indexPath.row] == "two")
        {
            cell.textLabel?.text = "Hồ sơ của tôi"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row == 0)
        {
            // kiem tra nguoi dung dang nhap chua ?
            if(User_flag == 1)
            {
               // dang xuat
                f.dangxuat()
                self.goto_MH_trangchu()
            }
            else if(User_flag != 1)
            {
                self.goto_MH_dangnhap()
            }
        }
        if(indexPath.row == 1)
        {
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
    
    func goto_MH_trangchu()
    {
        let scr = storyboard?.instantiateViewController(withIdentifier: "MH_trangchu")
        self.present(scr!, animated: true, completion: nil)
    }
    
}
