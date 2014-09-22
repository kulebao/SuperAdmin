//
//  School.swift
//  SuperAdmin
//
//  Created by kpse on 9/17/14.
//  Copyright (c) 2014 cocobabys. All rights reserved.
//

import Foundation

class School {
    let id: Int
    let name: String
    var principal: String
    let logoUrl: String
    var charge: Charge?
    
    init(id: Int, name: String, principal: String, logo: String) {
        self.id = id
        self.name = name
        self.principal = principal
        self.logoUrl = logo
    }
    
    convenience init(dic: [String: AnyObject]) {
        self.init(id: dic["school_id"]! as Int, name: dic["name"]! as String, principal: "王二", logo: dic["school_logo_url"]! as String)
    }
}