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
        ImageLoader.loadImage(school.logoUrl, target: self.logo)
        return self
    }
}