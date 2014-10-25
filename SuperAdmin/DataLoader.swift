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
    var engine: JSONHelper!
    var schools: [School] = []
    var userData: User!
    
    init() {
        
    }
    
    func loadSchoolsFromStage(callback: ([School]) -> Void) {
        self.login() {
            (user: User) in
            self.engine.HTTPGetJSONArray("\(self.serverHost)/kindergarten") {
                (data: [AnyObject], error: String?) in
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
    
    func principalCallback(school: School, callback: ([School]) -> Void)(data: [AnyObject], error: String?) {
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
                    s.principal = Teacher(name: "未指定", school: s.id, loginName: "", birthday: "1980-11-11", id: "0", phone: "-")
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
    
    func employeeCallback(school: School)(employeeData: [String: AnyObject], error: String?) {
        school.principal = Teacher(dic: employeeData)
    }
    
    func login(callback: (User) -> Void) {
        if engine != nil {
            callback(self.userData)
        } else {
            self.engine = JSONHelper()
            self.engine.HTTPPostJSON("\(self.serverHost)/employee_login.do", jsonObj: ["account_name": "operator", "password": "daishu"]){
                (data: String, error: String?) in
                if (error != nil) {
                    println(error)
                } else {
                    println(data)
                    self.userData = User(dic: self.engine.JSONParseDict(data))
                    callback(self.userData)
                }
            }
        }
        
        
    }
    func loadChargeInfoFromStage(callback: [School] -> Void) {
        self.login() {
            (user: User) in
            if self.schools.isEmpty {
                self.loadSchoolsFromStage(self.chargeInSchools(callback))
            } else {
                self.chargeInSchools(callback)(schools: self.schools)
            }
            
        }
    }
    
    func loadChargeInfoForSchool(school: School, callback: School -> Void) {
        self.login() {
            (user: User) in
            self.chargeInSingleSchool(school, callback: callback)
        }
    }
    
    func chargeInSingleSchool(school: School, callback: School -> Void) {
        self.engine.HTTPGetJSONArray("\(self.serverHost)/kindergarten/\(school.id)/charge", self.singleChargeCallback(school, callback: callback))

    }

    
    func chargeInSchools(callback: [School] -> Void)(schools: [School]) {
        self.schools = schools
        for school in schools {
            self.engine.HTTPGetJSONArray("\(self.serverHost)/kindergarten/\(school.id)/charge", self.chargeCallback(school, callback: callback))
        }
    }
    
    func singleChargeCallback(school: School, callback: School -> Void)(data: [AnyObject], error: String?) {
        if (error != nil) {
            println(error)
        } else {
            println(data[0])
            let res: AnyObject = data[0] as AnyObject
            school.charge = Charge(school: res["school_id"] as Int, member: res["total_phone_number"] as Int, video: res["total_video_account"] as Int, expiryDate:  res["expire_date"] as String)
            callback(school)
            
        }
    }
    
    func chargeCallback(school: School, callback: [School] -> Void)(data: [AnyObject], error: String?) {
        if (error != nil) {
            println(error)
        } else {
            println(data[0])
            let res: AnyObject = data[0] as AnyObject
            self.schools.filter({ (s: School) -> Bool in
                return s.id == res["school_id"] as Int
            }).map({(s:School) -> School in
                s.charge = Charge(school: res["school_id"] as Int, member: res["total_phone_number"] as Int, video: res["total_video_account"] as Int, expiryDate: res["expire_date"] as String)
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
        let t = Teacher(name: "王老师", school: 123, loginName: "a", birthday: "1980-11-11", id: "3_123", phone: "123")
        t.score = Score(assignment: 1, assess: 2, chat: 3, news: 4)
        let t2 = Teacher(name: "张老师", school: 321, loginName: "b", birthday: "1980-11-11", id: "3_124", phone: "124")
        t2.score = Score(assignment: 11, assess: 12, chat:33, news: 44)
        callback([t, t2])
    }
    
    func loadEmployeesFromStage(callback:[Teacher] -> Void) {
        self.login() {
            (user: User) in
            self.engine.HTTPGetJSONArray("\(self.serverHost)/employee") {
                (data: [AnyObject], error: String?) in
                if (error != nil) {
                    println(error)
                } else {
                    let teachers = data.map({teacher in Teacher(dic: teacher as [String: AnyObject])})
                    callback(teachers)
                }
            }
        }
    }
    
    func post(uri: String, json: AnyObject, succeed:(Int, String) -> Void, failed: (Int, String) -> Void) {
        self.login() {
            (user: User) in
            self.engine.HTTPPostJSON("\(self.serverHost)\(uri)", jsonObj: json) {
               (data: String, error: String?) -> Void in
                if (error != nil) {
                    println(error)
                    failed(1, error!)
                } else {
                    succeed(0, "")
                }
            }
        }

    }
}
