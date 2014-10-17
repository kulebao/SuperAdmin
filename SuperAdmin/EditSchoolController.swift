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
    @IBOutlet weak var videoLimitation: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        self.schoolId!.text = "\(self.school.id)"
        self.schoolName!.text = self.school.name
        self.shortName!.text = self.school.name
        self.contact!.text = self.school.principal.phone
        self.token!.text = self.school.token
        self.loginName!.text = self.school.principal.loginName
        self.expire!.text = self.school.charge!.expiryDate
        self.memberLimitation!.text = "\(self.school.charge!.totalPhoneNumber)"
        self.videoLimitation!.text = "\(self.school.charge!.totalVideoNumber)"
        self.address!.text = self.school.address
        self.saveButton.enabled = false
    }
    
    @IBAction func valueChange(sender: AnyObject) {
        self.saveButton.enabled = true
    }
    
    @IBAction func saveSchool(sender: AnyObject) {
        self.saveButton.enabled = false
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        super.prepareForSegue(segue, sender: sender)
        if segue.identifier == "editCharge"{
            let vc = segue.destinationViewController as EditSchoolChargeController
            vc.school = self.school
        }
    }

}