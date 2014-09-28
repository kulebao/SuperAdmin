//
//  HUDHelper.swift
//  SuperAdmin
//
//  Created by kpse on 9/28/14.
//  Copyright (c) 2014 cocobabys. All rights reserved.
//

import Foundation

class Spinner: NSObject, MBProgressHUDDelegate {
    
    let view: UIView
    let progHud: MBProgressHUD;
    
    init(view: UIView) {
        self.view = view
        self.progHud = MBProgressHUD(view: view)
    }
    
    func show(text: String) -> Void {
        self.progHud.labelText = text
        self.progHud.center = self.view.center
        self.progHud.delegate = self
        self.progHud.show(true)
        self.view.addSubview(self.progHud)
    }
    
    func hide() -> Void {
        self.progHud.hide(true)
        self.progHud.removeFromSuperview()
    }
}