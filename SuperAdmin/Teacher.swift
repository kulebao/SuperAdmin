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
    var school: School?
    
    init(name: String) {
        self.name = name
    }
}