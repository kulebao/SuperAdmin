//
//  User.swift
//  SuperAdmin
//
//  Created by kpse on 9/21/14.
//  Copyright (c) 2014 cocobabys. All rights reserved.
//

import Foundation

struct User {
    let id: String
    let name: String
    let portrait: String
    let phone: String
    let gender: Int
    let loginName: String
    let privilegeGroup: String
    
    init(id: String, name: String, portrait: String, phone: String, gender: Int, loginName: String, privilege: String) {
        self.id = id
        self.name = name
        self.portrait = portrait
        self.phone = phone
        self.gender = gender
        self.loginName = loginName
        self.privilegeGroup = privilege
    }
    
    init(dic: [String: AnyObject]) {
        self.init(id: dic["id"]! as! String, name: dic["name"]! as! String, portrait: dic["portrait"]! as! String, phone: dic["phone"]! as! String, gender: dic["gender"]! as! Int, loginName: dic["login_name"]! as! String, privilege: dic["privilege_group"]! as! String)
    }
    
    static func invalid() -> User {
        return User(id: "", name: "", portrait: "", phone: "", gender: 1, loginName: "", privilege: "")
    }
}