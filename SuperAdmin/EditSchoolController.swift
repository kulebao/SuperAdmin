//
//  EditSchoolController.swift
//  SuperAdmin
//
//  Created by kpse on 10/11/14.
//  Copyright (c) 2014 cocobabys. All rights reserved.
//

import Foundation

class EditSchoolController: UIViewController {
    var school : School!
    
    @IBOutlet weak var schoolId: UILabel!
    @IBOutlet weak var schoolName: UITextField!
    @IBOutlet weak var shortName: UITextField!
    @IBOutlet weak var contact: UITextField!
    @IBOutlet weak var token: UITextField!
    @IBOutlet weak var loginName: UILabel!
    @IBOutlet weak var expire: UILabel!
    @IBOutlet weak var memberLimitation: UILabel!
    @IBOutlet weak var address: UILabel!
    
    override func viewDidLoad() {
        self.schoolId!.text = "\(self.school.id)"
        self.schoolName!.text = self.school.name
        self.shortName!.text = self.school.name
        self.contact!.text = self.school.principal.phone
        self.token!.text = "token"
        self.loginName!.text = self.school.principal.loginName
        self.expire!.text = "1999-01-01"
        self.memberLimitation!.text = "99"
        self.address!.text = "Somewhere in China"
        
    }
}