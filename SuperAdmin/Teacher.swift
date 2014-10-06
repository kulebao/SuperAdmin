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
    let birthday: String
    
    var score: Score?
    
    init(name: String, school: Int, login_name: String, birthday: String) {
        self.name = name
        self.school = school
        self.login_name = login_name
        self.birthday = birthday
    }
    convenience init(dic: [String: AnyObject]) {
        self.init(name: dic["name"]! as String, school: dic["school_id"]! as Int, login_name: dic["login_name"]! as String, birthday: dic["birthday"]! as String)
    }
}