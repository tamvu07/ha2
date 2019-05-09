//
//  MH_Taohoso_ViewController.swift
//  ha2
//
//  Created by vuminhtam on 5/3/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class MH_Taohoso_ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var tableView: UITableView!
    let cellSpacingHeight: CGFloat = 15
 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        textView.backgroundColor = UIColor.orange
        textView.layer.borderColor = UIColor.blue.cgColor
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 8
        textView.clipsToBounds = true
    }


    
    override func viewWillAppear(_ animated: Bool) {
        let titleView:UIView = UIView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 25))
        let label:UILabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: 300, height: 25))
        label.text = "Tạo Hồ Sơ"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .center
        titleView.addSubview(label)
        
        self.navigationItem.titleView = titleView
    }
    
    func goto_MH_Thongtintaikhoan()
    {
        let scr = storyboard?.instantiateViewController(withIdentifier: "MH_Thongtintaikhoan")
        navigationController?.pushViewController(scr!, animated: true)
    }
    
    func goto_MH_Thongtintongquan()
    {
        let scr = storyboard?.instantiateViewController(withIdentifier: "MH_Thongtintongquan")
        navigationController?.pushViewController(scr!, animated: true)
    }
    
}

extension MH_Taohoso_ViewController: UITableViewDataSource,UITableViewDelegate
{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0)
        {
            return 4
        }
        return 1
    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cellID = ""
        if (indexPath.section == 0)
        {
            cellID = CELL1_Taohoso_TableViewCell.CELL1
        }else {
            cellID = CELL2_Taohoso_TableViewCell.CELL2
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)

        if (indexPath.section == 0)
        {
             let a = cell as! CELL1_Taohoso_TableViewCell

            // add border and color
//            a.backgroundColor = UIColor.white
//            a.layer.borderColor = UIColor.black.cgColor
//            a.layer.borderWidth = 1
//            a.layer.cornerRadius = 8
//            a.clipsToBounds = true
            
            if(indexPath.row == 0)
            {
                a.lb_1.text = "Thông tin tài khoản"
            }else  if(indexPath.row == 1)
            {
                a.lb_1.text = "Thông tin tổng quát"
            }else  if(indexPath.row == 2)
            {
                a.lb_1.text = "Kinh nghiệm làm việc"
            }else  if(indexPath.row == 3)
            {
                a.lb_1.text = "Trình độ và Bằng cấp"
            }
           
        }else{
            let a = cell as! CELL2_Taohoso_TableViewCell
            a.bt_lb.setTitle("Đăng Hồ Sơ", for: .normal )
        }
        
        return cell

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row == 0)
        {
            self.goto_MH_Thongtintaikhoan()
        }
        if(indexPath.row == 1)
        {
            self.goto_MH_Thongtintongquan()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let view:UIView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.bounds.size.width, height: 5))
        view.backgroundColor = .clear
        
        return view
    }
    // Set the spacing between sections
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }
    
    // Make the background color show through
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        
        return headerView
    }
    
}
