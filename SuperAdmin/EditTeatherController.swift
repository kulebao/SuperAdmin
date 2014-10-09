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
    
    @IBOutlet weak var birthday: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var cellPhone: UILabel!
    
    var schools: [School] = []
    var spinner: Spinner!
    
    let formatter = NSDateFormatter()
    
    required init(coder aDecoder: NSCoder) {
        self.formatter.dateFormat = "yyyy-MM-dd"
        super.init(coder: aDecoder)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.name!.text = self.teacher!.name
        self.school!.text = "\(self.teacher!.school)"
        self.loginName!.text = self.teacher!.loginName
        self.cellPhone!.text = self.teacher!.phone
        self.schoolList.hidden = true
        self.birthday.text = self.teacher!.birthday
        self.datePicker.hidden = true
        self.datePicker.datePickerMode = UIDatePickerMode.Date
        
        self.datePicker.date = self.formatter.dateFromString(self.birthday.text)!
        spinner = Spinner(view: self.view)
        spinner.show("Loading...")
        DataLoader().loadSchoolsFromStage(self.dataArrived)
    }
    func dataArrived(schools: [School]) -> Void {
        self.schools = schools
        dispatch_async(dispatch_get_main_queue(),{
            self.schoolList.reloadAllComponents()
            self.spinner.hide()
        });
    }
    
    @IBAction func save(sender: AnyObject) {
        spinner.show("Saving...")
        let data: [String: AnyObject] = ["name": self.name!.text as String, "school_id": self.school!.text.toInt()!, "login_name": self.loginName!.text as String, "birthday": self.birthday!.text as String, "id": self.teacher.id as String, "phone": self.cellPhone!.text! as String]
        let t = Teacher(dic: data)
        t.save(self.saved, self.saveFailed)
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

    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        let school = schools[row]
        return "\(school.id) \(school.name)"
        
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        school.text = "\(schools[row].id)"
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return schools.count
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        if textField == self.birthday {
            self.datePicker.hidden = false
        }
        if textField == self.school {
            self.schoolList.hidden = false
        }
        return true
    }
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        if textField == self.birthday {
            self.datePicker.hidden = true
        }
        if textField == self.school {
            self.schoolList.hidden = true
        }
        return true
    }
    
    @IBAction func valueChanged(sender: UIDatePicker) {
        
        self.birthday.text = formatter.stringFromDate(sender.date)
    }
}