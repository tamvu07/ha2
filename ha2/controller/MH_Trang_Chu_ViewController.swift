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
import Firebase
// tao lien ket voi database
var ref = Database.database().reference()

class MH_Trang_Chu_ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource{

    let f = chucnang()
    var array_congty:Array<CongTy> = Array<CongTy>()
    @IBOutlet weak var tb_List_CongTy: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tb_List_CongTy.delegate = self
        tb_List_CongTy.dataSource = self
        
        if(User_flag != 1)
        {
            f.dangxuat()
        }
        
        // dua du lieu len database

        let tablename = ref.child("cong ty ung tuyen")
        let congtys = tablename.child("cong ty A")
        // khoi tao 1 user de up len fire base
        let ct:Dictionary<String,String> = ["ten cong ty":"abc",
                                            "cong viec":"ke toan",
                                            "dia chi":"123"
        ]
        congtys.setValue(ct)
        
        let congtysB = tablename.child("cong ty B")
        // khoi tao 1 user de up len fire base
        let ctB:Dictionary<String,String> = ["ten cong ty":"B",
                                            "cong viec":"ke toan",
                                            "dia chi":"1"
        ]
        congtysB.setValue(ctB)
       
        tablename.observe(.childAdded, with: { (snapshot) in
            // lay du lieu luu vao postDict
            let postDict = snapshot.value as? [String: AnyObject]
            if(postDict != nil)
            {
                //                print("................\(postDict)...................")
                let tencongty:String = (postDict?["ten cong ty"])! as! String
                let congviec:String = (postDict?["cong viec"])! as! String
                let diachi:String = (postDict?["dia chi"])! as! String
                let congty:CongTy =  CongTy(idCT: snapshot.key, tencongty: tencongty, congviec: congviec, diachi: diachi)
                self.array_congty.append(congty)
                print("........>>>>>>>>>>>>\(self.array_congty.count).................")
            }
        })
        self.tb_List_CongTy.reloadData()
        
    }

    // lam viec voi table view
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("............\(array_congty.count)......................")
       return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tb_List_CongTy.dequeueReusableCell(withIdentifier: "CELL", for: indexPath) as! CELLS_Trang_Chu_TableViewCell

//        cell.lb2.text = array_congty[indexPath.row].diachi
//        cell.lb3.text = array_congty[indexPath.row].congviec
       
        return cell
    }
    
}
