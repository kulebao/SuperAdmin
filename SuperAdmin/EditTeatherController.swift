//
//  EditTeatherController.swift
//  SuperAdmin
//
//  Created by kpse on 9/30/14.
//  Copyright (c) 2014 cocobabys. All rights reserved.
//

import Foundation

class EditTeatherController: UIViewController {
    
    var teacher: Teacher!
    
    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var school: UITextField!
   
    @IBOutlet weak var loginName: UITextField!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.name!.text = self.teacher!.name
        self.school!.text = "\(self.teacher!.school)"
        self.loginName!.text = self.teacher!.login_name
    }
    
    @IBAction func save(sender: AnyObject) {
        
    }
   
   
}