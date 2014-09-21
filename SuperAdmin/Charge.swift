//
//  Charge.swift
//  SuperAdmin
//
//  Created by kpse on 9/21/14.
//  Copyright (c) 2014 cocobabys. All rights reserved.
//

import Foundation

class Charge {
    let schoolId: Int
    let totalPhoneNumber: Int
    let totalVideoNumber: Int
    
    init(school: Int, member: Int, video: Int) {
        self.schoolId = school
        self.totalPhoneNumber = member
        self.totalVideoNumber = video
    }
}