//
//  LoginViewController.swift
//  SuperAdmin
//
//  Created by kpse on 11/17/14.
//  Copyright (c) 2014 cocobabys. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var hostname: UITextField!
    
    @IBOutlet weak var warning: UILabel!
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        warning.hidden = true
        // Do any additional setup after loading the view.
        loginButton.enabled = false
    }
    
    
    @IBAction func login(sender: AnyObject) {
        
        if isAllFieldsValid() {
            Credential.hostname = hostname.text
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
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
