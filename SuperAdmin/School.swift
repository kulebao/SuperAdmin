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
    let principal: String
    let logoUrl: String
    
    init(id: Int, name: String, principal: String, logo: String) {
        self.id = id
        self.name = name
        self.principal = principal
        self.logoUrl = logo
    }
}