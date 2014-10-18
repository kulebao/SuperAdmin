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
        spinner.show("Saving...")
        let charge = Charge(school: self.school!.id as Int, member: self.memberCount.text.toInt()!, video: self.videoMemberCount.text.toInt()!, expiryDate: self.school.charge!.expiryDate)
        charge.save(self.saved, self.saveFailed)
    }
    
    func saved(code: Int, msg: String){
        dispatch_async(dispatch_get_main_queue()) {
            self.spinner.hide()
            self.navigationController?.popViewControllerAnimated(true)
        }
    }
    
    func saveFailed(code: Int, msg: String){
        dispatch_async(dispatch_get_main_queue()) {
            self.spinner.hide()
        }
    }
    
    @IBAction func valueChange(sender: AnyObject) {
        self.saveButton.enabled = true
    }
}