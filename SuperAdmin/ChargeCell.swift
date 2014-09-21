//
//  ChargeCell.swift
//  SuperAdmin
//
//  Created by kpse on 9/21/14.
//  Copyright (c) 2014 cocobabys. All rights reserved.
//

import Foundation

class ChargeCell: UITableViewCell {

    @IBOutlet var name: UILabel!
    @IBOutlet var member: UILabel!
    @IBOutlet var video: UILabel!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func loadContent(charge: Charge) -> ChargeCell {
        self.name!.text = "学校：\(charge.schoolId)"
        self.member!.text = "会员总数：\(charge.totalPhoneNumber)"
        self.video!.text = "视频总数：\(charge.totalVideoNumber)"
    
        return self
    }
    
}