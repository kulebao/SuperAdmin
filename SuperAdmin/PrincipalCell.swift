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
    
    func loadContent(teacher: Teacher) -> PrincipalCell {
        self.name!.text = teacher.name
        if teacher.school == 0 {
            self.school!.text = "超级管理员"
        } else {
            self.school!.text = "所在学校: \(teacher.school)"
        }
        
        
        return self
    }
    
}