//
//  LoginViewController.swift
//  SuperAdmin
//
//  Created by kpse on 11/17/14.
//  Copyright (c) 2014 cocobabys. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func login(sender: AnyObject) {
        let mainSB = UIStoryboard(name:"Main", bundle: nil)
        
        let mainWidow = UIApplication.sharedApplication().delegate?.window
        mainWidow!?.rootViewController = mainSB.instantiateInitialViewController() as? UIViewController

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
