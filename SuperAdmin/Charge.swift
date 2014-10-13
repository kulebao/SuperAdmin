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
    let expiryDate: String
    
    init(school: Int, member: Int, video: Int, expiryDate: String) {
        self.schoolId = school
        self.totalPhoneNumber = member
        self.totalVideoNumber = video
        self.expiryDate = expiryDate
    }
}