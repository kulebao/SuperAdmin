//
//  SchoolCell.swift
//  SuperAdmin
//
//  Created by kpse on 9/15/14.
//  Copyright (c) 2014 cocobabys. All rights reserved.
//

import Foundation

class SchoolCell: UITableViewCell {
    
    @IBOutlet var label: UILabel!

    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: UITableViewCellStyle.Value1, reuseIdentifier: reuseIdentifier)
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}