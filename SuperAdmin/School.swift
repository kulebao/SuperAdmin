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
    let fullName: String
    let token: String
    let logoUrl: String
    let address: String
    
    var principal: Teacher
    var charge: Charge?
    
    init(id: Int, name: String, principal: String, logo: String, fullName: String, token: String, address: String) {
        self.id = id
        self.name = name
        self.principal = Teacher(name: principal, school: id, loginName: "", birthday: "1979-01-01", id: "3_1_2", phone: "123123")
        self.logoUrl = logo
        self.fullName = fullName
        self.token = token
        self.address = address
    }
    
    convenience init(dic: [String: AnyObject]) {
        self.init(id: dic["school_id"]! as Int, name: dic["name"]! as String, principal: "王二", logo: dic["school_logo_url"]! as String, fullName: dic["full_name"]! as String, token: dic["token"]! as String, address: School.addressOfSchool(dic["address"]) )
    }
    
    class func addressOfSchool(input: Optional<AnyObject>) -> String {
        if let address = input as? String {
            return address
        } else {
            return ""
        }
    }
    func save(succeed:(Int, String) -> Void, failed: (Int, String) -> Void)  {
        DataLoader().post("/kindergarten/\(self.id)", json: self.createJson(), succeed: succeed, failed: failed)
    }
    func createJson() -> AnyObject {
        return ["school_id": self.id, "phone": "123", "timestamp": 0, "desc": "desc", "school_logo_url": "", "name": self.name, "address": self.address, "full_name": self.fullName, "token": self.token]
    }
}