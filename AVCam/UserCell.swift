//
//  UserCell.swift
//  AVCam Swift
//
//  Created by 小林 泰 on 2017/03/16.
//  Copyright © 2017年 Apple, Inc. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {
    
    
    //@IBOutlet weak var userCell: UITableViewCell!
    @IBOutlet weak var firstNameLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setCheckmark(selected: false)
        
    }
    
    func updateUI(user: User) {
        
        firstNameLbl.text = user.firstName
        
        
    }
    
    func setCheckmark(selected: Bool) {
        let imageStr = selected ? "messageindicatorchecked1" : "messageindicator1"
        self.accessoryView = UIImageView(image: UIImage(named: imageStr))
    }
    
    

}
