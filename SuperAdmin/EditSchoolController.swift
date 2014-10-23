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
    var spinner: Spinner!
    
    @IBOutlet weak var schoolId: UILabel!
    @IBOutlet weak var schoolName: UITextField!
    @IBOutlet weak var shortName: UITextField!
    @IBOutlet weak var contact: UITextField!
    @IBOutlet weak var token: UITextField!
    @IBOutlet weak var loginName: UILabel!
    @IBOutlet weak var expire: UILabel!
    @IBOutlet weak var memberLimitation: UILabel!
    @IBOutlet weak var address: UITextField!
    
    @IBOutlet weak var logoUrl: UILabel!
    @IBOutlet weak var videoLimitation: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        spinner = Spinner(view: self.view)
        spinner.show("Loading...")
        DataLoader().loadChargeInfoForSchool(self.school, self.dataArrived)
    }
    
    func dataArrived(school: School) {
        self.school = school
        dispatch_async(dispatch_get_main_queue(),{
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
            self.logoUrl!.text = self.school.logoUrl
            self.saveButton.enabled = false
            self.spinner.hide()
        });
    }
    
    @IBAction func valueChange(sender: AnyObject) {
        self.saveButton.enabled = true
    }
    
    @IBAction func saveSchool(sender: AnyObject) {
        self.saveButton.enabled = false
        let school = School(id: self.school.id, name: self.shortName.text, principal: self.school.principal.name, logo: self.school.logoUrl, fullName: self.schoolName.text, token: self.token.text, address: self.address.text)
        school.save(self.saved, self.saveFailed)
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        super.prepareForSegue(segue, sender: sender)
        if segue.identifier == "editCharge"{
            let vc = segue.destinationViewController as EditSchoolChargeController
            vc.school = self.school
        }
    }
    
}