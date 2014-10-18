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
    func save(succeed:(Int, String) -> Void, failed: (Int, String) -> Void)  {
        DataLoader().post("/kindergarten/\(self.schoolId)/charge", json: self.createJson(), succeed: succeed, failed: failed)
    }
    func createJson() -> AnyObject {
        return ["school_id": self.schoolId, "total_phone_number": self.totalPhoneNumber, "expire_date": self.expiryDate, "status": 1, "used": 0, "total_video_account": self.totalVideoNumber]
    }
    
}