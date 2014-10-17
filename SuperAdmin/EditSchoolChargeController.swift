//
//  EditSchoolChargeController.swift
//  SuperAdmin
//
//  Created by kpse on 10/17/14.
//  Copyright (c) 2014 cocobabys. All rights reserved.
//

import Foundation

class EditSchoolChargeController: UIViewController {
    var school : School!
    
    @IBOutlet weak var schoolId: UILabel!
    @IBOutlet weak var schoolName: UILabel!
    
    @IBOutlet weak var memberCount: UITextField!
    @IBOutlet weak var videoMemberCount: UITextField!
    override func viewDidLoad() {
        self.schoolId.text = "\(self.school.id)"
        self.schoolName.text = self.school.name
        self.memberCount.text = "\(self.school.charge!.totalPhoneNumber)"
        self.videoMemberCount.text = "\(self.school.charge!.totalVideoNumber)"
    }
    @IBAction func saveCharge(sender: AnyObject) {
    }
}