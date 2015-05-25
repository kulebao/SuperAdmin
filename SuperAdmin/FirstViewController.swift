//
//  FirstViewController.swift
//  SuperAdmin
//
//  Created by kpse on 9/13/14.
//  Copyright (c) 2014 cocobabys. All rights reserved.
//

import UIKit


class FirstViewController: UIViewController, MBProgressHUDDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func logout(sender: AnyObject) {
        if let window = UIApplication.sharedApplication().delegate?.window! {
            var loginVC = LoginViewController(nibName: "LoginViewController", bundle: NSBundle.mainBundle())
            window.rootViewController = loginVC
        }
    }
    
}

