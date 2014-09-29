//
//  DataLoader.swift
//  SuperAdmin
//
//  Created by kpse on 9/18/14.
//  Copyright (c) 2014 cocobabys. All rights reserved.
//

import Foundation

class DataLoader {
    
    let serverHost: String = "http://127.0.0.1:9000"
    let engine = JSONHelper()
    var schools: [School] = []
    
    func loadSchoolsFromStage(callback: ([School]) -> Void) -> Void {
        self.login() {
            (user: User) -> Void in
            self.engine.HTTPGetJSONArray("\(self.serverHost)/kindergarten") {
                (data: [AnyObject], error: String?) -> Void in
                if (error != nil) {
                    println(error)
                } else {
                    self.schools = data.map({school in School(dic: school as [String: AnyObject])})
                    
                    for school in self.schools {
                        self.engine.HTTPGetJSONArray("\(self.serverHost)/kindergarten/\(school.id)/principal", self.principalCallback(school, callback))
                    }
                }
            }
        }
        
    }
    
    func principalCallback(school: School, callback: ([School]) -> Void)(data: [AnyObject], error: String?) -> Void {
        if (error != nil) {
            println(error)
        } else {
            self.schools.filter({ (s: School) -> Bool in
                return s.id == school.id as Int
            }).map({(s:School) -> School in
                if (data.count > 0 && data[0]["phone"] as? String != nil) {
                    let phone: String = data[0]["phone"] as String
                    self.engine.HTTPGetJSON("\(self.serverHost)/kindergarten/\(s.id)/employee/\(phone)", self.employeeCallback(s))
                } else {
                    s.principal = Teacher(name: "未指定", school: s.id)
                }
                return s
            })
            
        }
        if self.schools.filter({ (s: School) -> Bool in
            return s.principal.name.isEmpty
        }).count == 0 {
            callback(self.schools)
        }
    }
    
    func employeeCallback(school: School)(employeeData: [String: AnyObject], error: String?) -> Void {
        school.principal = Teacher(name: employeeData["name"]! as String, school: employeeData["school_id"]! as Int)
    }
    
    func login(callback: (User) -> Void) -> Void {
        self.engine.HTTPPostJSON("\(self.serverHost)/employee_login.do", jsonObj: ["account_name": "operator", "password": "daishu"]){
            (data: String, error: String?) -> Void in
            if (error != nil) {
                println(error)
            } else {
                println(data)
                callback(User(dic: self.engine.JSONParseDict(data)))
            }
        }
        
    }
    func loadChargeInfoFromStage(callback: [School] -> Void) -> Void {
        self.login() {
            (user: User) -> Void in
            if self.schools.isEmpty {
                self.loadSchoolsFromStage(self.chargeInSchool(callback))
            } else {
                self.chargeInSchool(callback)(schools: self.schools)
            }
            
        }
    }
    func chargeInSchool(callback: [School] -> Void)(schools: [School]) -> Void {
        self.schools = schools
        for school in schools {
            self.engine.HTTPGetJSONArray("\(self.serverHost)/kindergarten/\(school.id)/charge", self.chargeCallback(school, callback: callback))
        }
    }
    
    func chargeCallback(school: School, callback: [School] -> Void)(data: [AnyObject], error: String?) -> Void {
        if (error != nil) {
            println(error)
        } else {
            println(data[0])
            let res: AnyObject = data[0] as AnyObject
            self.schools.filter({ (s: School) -> Bool in
                return s.id == res["school_id"] as Int
            }).map({(s:School) -> School in
                s.charge = Charge(school: res["school_id"] as Int, member: res["total_phone_number"] as Int, video: res["total_video_account"] as Int)
                return s
            })
        }
        if self.schools.filter({ (s: School) -> Bool in
            return s.charge? == nil
        }).count == 0 {
            callback(self.schools)
        }
    }
    func loadScoreInfoFromStage(callback:[Teacher] -> Void) {
        let t = Teacher(name: "王老师", school: 123)
        t.score = Score(assignment: 1, assess: 2, chat: 3, news: 4)
        let t2 = Teacher(name: "张老师", school: 321)
        t2.score = Score(assignment: 11, assess: 12, chat:33, news: 44)
        callback([t, t2])
    }
    
    func loadEmployeesFromStage(callback:[Teacher] -> Void) {
        self.login() {
            (user: User) -> Void in
            self.engine.HTTPGetJSONArray("\(self.serverHost)/employee") {
                (data: [AnyObject], error: String?) -> Void in
                if (error != nil) {
                    println(error)
                } else {
                    let teachers = data.map({teacher in Teacher(dic: teacher as [String: AnyObject])})
                    callback(teachers)
                }
            }
        }
    }
}
