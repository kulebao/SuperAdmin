//
//  EditTeatherController.swift
//  SuperAdmin
//
//  Created by kpse on 9/30/14.
//  Copyright (c) 2014 cocobabys. All rights reserved.
//

import Foundation

class EditTeatherController: UIViewController {
    
    @IBOutlet weak var name: UILabel!
    var teacher: Teacher!
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.name!.text = self.teacher!.name
    }
   
   
}