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
    let login_name: String
    let phone: String
    let id: String
    let birthday: String
    
    var score: Score?
    
    init(name: String, school: Int, login_name: String, birthday: String, id: String, phone: String) {
        self.name = name
        self.school = school
        self.login_name = login_name
        self.birthday = birthday
        self.id = id
        self.phone = phone
    }
    convenience init(dic: [String: AnyObject]) {
        self.init(name: dic["name"]! as String, school: dic["school_id"]! as Int, login_name: dic["login_name"]! as String, birthday: dic["birthday"]! as String, id: dic["id"]! as String, phone: dic["phone"]! as String)
    }
}