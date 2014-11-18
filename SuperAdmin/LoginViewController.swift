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
            
        
        
        let mainSB = UIStoryboard(name:"Main", bundle: nil)
        
        let mainWidow = UIApplication.sharedApplication().delegate?.window
        mainWidow!?.rootViewController = mainSB.instantiateInitialViewController() as? UIViewController
        Credential.hostname = hostname.text
        Credential.username = username.text
        Credential.password = password.text
        } else {
            warning.text = "请填写所有字段。"
            warning.hidden = false
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
