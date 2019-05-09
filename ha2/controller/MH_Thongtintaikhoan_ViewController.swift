//
//  MH_Thongtintaikhoan_ViewController.swift
//  ha2
//
//  Created by vuminhtam on 5/6/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import DLRadioButton

class MH_Thongtintaikhoan_ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var RadioButtonValue:String!
    @IBOutlet weak var txt_date: UITextField!
    private var datePicker:UIDatePicker?
    @IBOutlet weak var Picker_TP: UIPickerView!
    @IBOutlet weak var text_TP: UITextField!
    
    
    let arr_TP = [
        "An Giang",
        "Bà Rịa - Vũng Tàu",
        "Bắc Giang",
        "Bắc Kạn",
        "Bạc Liêu",
        "Bắc Ninh",
        "Bến Tre",
        "Bình Định",
        "Bình Dương",
        "Bình Phước",
        "Bình Thuận",
        "Cà Mau",
        "Cao Bằng",
        "Đắk Lắk",
        "Đắk Nông",
        "Điện Biên",
        "Đồng Nai",
        "Đồng Tháp",
        "Gia Lai",
        "Hà Giang",
        "Cần Thơ",
        "Đà Nẵng",
        "Hải Phòng",
        "Hà Nội",
        "Thành Phố Hồ Chí Minh",
        "Quảng Nam",
        "Quảng Ngãi",
        "Quảng Ninh",
        "Quảng Trị",
        "Sóc Trăng",
        "Sơn La",
        "Tây Ninh",
        "Thái Bình",
        "Thái Nguyên",
        "Thanh Hóa",
        "Thừa Thiên Huế",
        "Tiền Giang",
        "Trà Vinh",
        "Tuyên Quang",
        "Vĩnh Long"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Picker_TP.delegate = self
        Picker_TP.dataSource = self
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(MH_Thongtintaikhoan_ViewController.dataChanged(dataPicker:)), for: .valueChanged)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(MH_Thongtintaikhoan_ViewController.viewTapped(gestureRecognizer:)))
        view.addGestureRecognizer(tapGesture)
        txt_date.inputView = datePicker
        
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer)  {
        view.endEditing(true)
    }
    
    // function ngay thang nam
    @objc func dataChanged(dataPicker: UIDatePicker) {
        let dataFormatter = DateFormatter()
        dataFormatter.dateFormat = "MM/dd/yyyy"
        txt_date.text = dataFormatter.string(from: (datePicker?.date)!)
        view.endEditing(true)
    }
    //radio button
    @objc @IBAction private func logSelectedButton(_ radioButton : DLRadioButton) {
        if (radioButton.isMultipleSelectionEnabled) {
            for button in radioButton.selectedButtons() {
                print(String(format: "%@ is selected ha .\n", button.titleLabel!.text!));
            }
        } else {
            RadioButtonValue = radioButton.selected()?.titleLabel?.text!
            //            print(String(format: "%@ is selected.\n", RadioButtonValue));
            let x:String = String(format: "%@", RadioButtonValue);
            if(x == "Nam")
            {
                print("..............vua chon la:\(x)....................\n")
            }else
                if(x == "Nữ")
                {
                   print("..............vua chon la:\(x)....................\n")
            }else if(x == "Chưa")
            {
                print("..............vua chon la:\(x)....................\n")
            }else
                if(x == "Rồi")
                {
                    print("..............vua chon la:\(x)....................\n")
            }
        }
    }

    // lam viec voi chon thanh pho ppicker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arr_TP.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arr_TP[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        text_TP.text = arr_TP[row]
    }
    
    // khi bam nut luu
    @IBAction func bt_Luu(_ sender: Any) {
//        print("............current ủe la :\(currenUser.email)....\n")
        // dua du lieu len database
        let tablename = ref.child("Thong Tin User")
        let congtys = tablename.child("Thong Tin")
        // khoi tao 1 user de up len fire base
        let ct:Dictionary<String,String> = ["ten cong ty":"phat dat",
                                            "cong viec":"công nghệ thực phẩm",
                                            "dia chi":"123/123 duong so 2",
                                            "avatar":"https://newimageasia.vn/image/catalog/newimage/Home3-091.png",
                                            "luong":"1000 $",
                                            "motacongviec":"làm việc toàn thời gian, độ tuổi: lớn hơn 17 nhỏ hơn 31, siêng năng, có tinh thần học hỏi, biết tiếng anh. ",
                                            "email":"phatdai@gmail.com",
                                            "sdt":"0956211155"

        ]
        congtys.setValue(ct)
    }
    
    
}
