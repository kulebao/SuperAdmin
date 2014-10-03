//
//  EditTeatherController.swift
//  SuperAdmin
//
//  Created by kpse on 9/30/14.
//  Copyright (c) 2014 cocobabys. All rights reserved.
//

import Foundation

class EditTeatherController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    var teacher: Teacher!
    
    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var school: UITextField!
   
    @IBOutlet weak var loginName: UITextField!
    
    @IBOutlet weak var schoolList: UIPickerView!
    
    let schools = [1000, 1001]

    var numberOfComponents: Int = 1
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.name!.text = self.teacher!.name
        self.school!.text = "\(self.teacher!.school)"
        self.loginName!.text = self.teacher!.login_name
        self.schoolList.hidden = true
    }
    
    @IBAction func save(sender: AnyObject) {
        
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return "\(schools[row])"
    }
   
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        school.text = "\(schools[row])"
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
   
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return schools.count
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        self.schoolList.hidden = false
        return true
    }
}