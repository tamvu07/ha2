//
//  CELL2_Taohoso_TableViewCell.swift
//  ha2
//
//  Created by vuminhtam on 5/3/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class CELL2_Taohoso_TableViewCell: UITableViewCell {

    static let CELL2 = "CELL2"
    @IBOutlet weak var bt_lb: UIButton!
    
    @IBAction func bt_Action(_ sender: Any) {
        print("...........co ok !.................\n")
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
