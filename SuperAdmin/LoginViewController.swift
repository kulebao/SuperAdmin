//
//  LoginViewController.swift
//  SuperAdmin
//
//  Created by kpse on 11/17/14.
//  Copyright (c) 2014 cocobabys. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource,UITextFieldDelegate {
    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var hostname: UITextField!
    
    @IBOutlet weak var warning: UILabel!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var xxx: NSLayoutConstraint!
    
    var hostPicker: UIPickerView!
    var lastHostName: String!
    #if DEBUG
    let hosts = ["local", "stage", "prod"]
    #else
    let hosts = ["stage", "prod"]
    #endif
    let hostsMap = ["local": "http://localhost:9000", "stage": "https://stage2.cocobabys.com", "prod": "https://www.cocobabys.com"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        warning.hidden = true
        // Do any additional setup after loading the view.
        loginButton.enabled = false
        hostname.text = hosts[0]
        hostPicker = self.createHostPicker()
        hostname.inputView = hostPicker
        hostname.inputAccessoryView = self.createHostPickerToolBar()
        
        xxx.constant = 8
        self.hideAllInputView()
    }
    
    
    @IBAction func login(sender: AnyObject) {
        
        if isAllFieldsValid() {
            if let host = self.hostsMap[hostname.text] {
                Credential.hostname = host
            } else {
                Credential.hostname = self.hostsMap["localhost"]
            }

            Credential.username = username.text
            Credential.password = password.text
            
            DataLoader().login() {
                (user: User) in
                if user.id.isEmpty {
                    self.showErrorMessage("登陆失败。请确认用户名密码和服务器地址。")
                } else {
                    self.gotoMainPage(user)
                }
                
            }
        } else {
            showErrorMessage("请填写所有字段。")
            
        }
        
    }

    func createHostPicker() -> UIPickerView {
        let hostPicker = UIPickerView()
        hostPicker.delegate = self
        hostPicker.dataSource = self
        return hostPicker
    }

    func createHostPickerToolBar() -> UIToolbar {
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.Default
        toolBar.translucent = true
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        toolBar.sizeToFit()


        let doneButton = UIBarButtonItem(barButtonSystemItem:.Done, target: self, action: "donePicker")
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(barButtonSystemItem:.Cancel, target: self, action: "cancelPicker")

        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.userInteractionEnabled = true
        return toolBar
    }

    func gotoMainPage(user: User) {
        dispatch_async(dispatch_get_main_queue()) {
            let mainSB = UIStoryboard(name:"Main", bundle: nil)
            
            let mainWidow = UIApplication.sharedApplication().delegate?.window
            mainWidow!?.rootViewController = mainSB.instantiateInitialViewController() as? UIViewController
        }
    }
    
    func showErrorMessage(msg: String) {
        dispatch_async(dispatch_get_main_queue()) {
            self.warning.text = msg
            self.warning.hidden = false
            
        }
    }
    
    @IBAction func editingChange(sender: AnyObject) {
        warning.hidden = true
        if isAllFieldsValid() {
            loginButton.enabled = true
        }
    }
    
    func isAllFieldsValid() -> Bool {
        return !hostname.text.isEmpty && !username.text.isEmpty && !password.text.isEmpty
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return self.hosts[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.editingChange(pickerView)
        self.hostname.text = self.hosts[row]
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.hosts.count
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        self.hideAllInputView()
        self.hostPicker.hidden = (textField != self.hostname!)
        self.lastHostName = self.hostname.text
        return true
    }
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        if textField == self.hostname! {
            self.hostPicker.hidden = true
        }
        return true
    }
    
    func hideAllInputView() {
        self.hostPicker.hidden = true
    }
    
    func donePicker() {
        self.hostname.resignFirstResponder()
    }

    func cancelPicker() {
        self.hostname.resignFirstResponder()
        self.hostname.text = self.lastHostName
        self.hostPicker.selectRow(self.indexOf(self.lastHostName), inComponent: 0, animated: false)
    }
    
    func indexOf(name: String) -> Int {
        if let i = find(hosts, name) {
            return i
        }
        return 0
    }
    
    
}
