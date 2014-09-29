//
//  ChargeCell.swift
//  SuperAdmin
//
//  Created by kpse on 9/21/14.
//  Copyright (c) 2014 cocobabys. All rights reserved.
//

import Foundation

class ChargeCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var member: UILabel!
    @IBOutlet weak var video: UILabel!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func loadContent(school: School) -> ChargeCell {
        self.name!.text = "学校：\(school.name)"
        let charge = school.charge!
        self.member!.text = "会员总数：\(charge.totalPhoneNumber)"
        self.video!.text = "视频总数：\(charge.totalVideoNumber)"
        return self
    }
    
}