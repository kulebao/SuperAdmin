//
//  SchoolCell.swift
//  SuperAdmin
//
//  Created by kpse on 9/15/14.
//  Copyright (c) 2014 cocobabys. All rights reserved.
//

import Foundation

class SchoolCell: UITableViewCell {
    
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var principal: UILabel!
    @IBOutlet weak var logo: UIImageView!
    
    var school: School!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func loadContent(school: School) -> SchoolCell {
        self.school = school
        self.id!.text = "id: \(school.id)"
        self.name!.text = school.name
        self.principal!.text = "校长：\(school.principal.name)"
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