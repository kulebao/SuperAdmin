//
//  SchoolCell.swift
//  SuperAdmin
//
//  Created by kpse on 9/15/14.
//  Copyright (c) 2014 cocobabys. All rights reserved.
//

import Foundation

class SchoolCell: UITableViewCell {
    
    @IBOutlet var id: UILabel!
    @IBOutlet var name: UILabel!
    @IBOutlet var principal: UILabel!
    @IBOutlet var logo: UIImageView!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: UITableViewCellStyle.Value1, reuseIdentifier: reuseIdentifier)
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func loadContent(school: School) -> SchoolCell {
        self.id!.text = "id: \(school.id)"
        self.name!.text = school.name
        self.principal!.text = "校长：\(school.principal)"
        dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            let imageUrl = school.logoUrl
            var imageData =  UIImage(data: NSData(contentsOfURL: NSURL(string:school.logoUrl)))
            dispatch_sync(dispatch_get_main_queue()!, {
                if school.logoUrl == imageUrl {
                    self.logo.image = imageData
                    self.setNeedsLayout()
                    self.layoutIfNeeded()
                }
            })
        })
        return self
    }
}