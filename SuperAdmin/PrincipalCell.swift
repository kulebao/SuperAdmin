//
//  PrincipalCell.swift
//  SuperAdmin
//
//  Created by kpse on 9/29/14.
//  Copyright (c) 2014 cocobabys. All rights reserved.
//

import UIKit

class PrincipalCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var school: UILabel!
   
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func loadContent(school: School) -> PrincipalCell {
        self.name!.text = school.principal.name
        self.school!.text = "所在学校: \(school.name)"
        return self
    }
    
}