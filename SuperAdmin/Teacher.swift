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
    var score: Score?
    let school: Int
    
    init(name: String, school: Int) {
        self.name = name
        self.school = school
    }
    convenience init(dic: [String: AnyObject]) {
        self.init(name: dic["name"]! as String, school: dic["school_id"]! as Int)
    }
}