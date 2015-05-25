//
//  Teacher.swift
//  SuperAdmin
//
//  Created by kpse on 9/28/14.
//  Copyright (c) 2014 cocobabys. All rights reserved.
//

import Foundation

class Teacher {
    let name: String
    let school: Int
    let loginName: String
    let phone: String
    let id: String
    let birthday: String
    
    var score: Score?
    
    init(name: String, school: Int, loginName: String, birthday: String, id: String, phone: String) {
        self.name = name
        self.school = school
        self.loginName = loginName
        self.birthday = birthday
        self.id = id
        self.phone = phone
    }
    convenience init(dic: [String: AnyObject]) {
        self.init(name: dic["name"]! as! String, school: dic["school_id"]! as! Int, loginName: dic["login_name"]! as! String, birthday: dic["birthday"]! as! String, id: dic["id"]! as! String, phone: dic["phone"]! as! String)
    }
    
    func save(succeed:(Int, String) -> Void, failed: (Int, String) -> Void)  {
        DataLoader().post("/employee/\(self.id)", json: self.createJson(), succeed: succeed, failed: failed)
    }
    func createJson() -> AnyObject {
        return ["id": self.id, "workgroup": "", "phone": self.phone, "name": self.name, "school_id": self.school, "login_name": self.loginName, "workduty": "", "gender": 1, "birthday": self.birthday]
    }
}