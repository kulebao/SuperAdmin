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
    
    @IBOutlet weak var hostPicker: UIPickerView!
    
    let hosts = ["local", "stage", "prod"]
    let hostsMap = ["local": "http://localhost:9000", "stage": "https://stage2.cocobabys.com", "prod": "https://www.cocobabys.com"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        warning.hidden = true
        // Do any additional setup after loading the view.
        loginButton.enabled = false
        hostname.text = hosts[0]
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
    
    
}
