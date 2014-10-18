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
    var spinner: Spinner!
    
    @IBOutlet weak var schoolId: UILabel!
    @IBOutlet weak var schoolName: UILabel!
    
    @IBOutlet weak var memberCount: UITextField!
    @IBOutlet weak var videoMemberCount: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    override func viewDidLoad() {
        self.schoolId.text = "\(self.school.id)"
        self.schoolName.text = self.school.name
        self.memberCount.text = "\(self.school.charge!.totalPhoneNumber)"
        self.videoMemberCount.text = "\(self.school.charge!.totalVideoNumber)"
        self.saveButton.enabled = false
        spinner = Spinner(view: self.view)
        
    }
    @IBAction func saveCharge(sender: AnyObject) {
//        spinner.show("Loading...")
        self.navigationController?.popViewControllerAnimated(true)
    }
    @IBAction func valueChange(sender: AnyObject) {
        self.saveButton.enabled = true
    }
}