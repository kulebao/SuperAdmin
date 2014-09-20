//
//  DataLoader.swift
//  SuperAdmin
//
//  Created by kpse on 9/18/14.
//  Copyright (c) 2014 cocobabys. All rights reserved.
//

import Foundation

class DataLoader {
    func loadSchools() -> [School] {
        return [
            School(id: 99999, name: "武警总队二小", principal: "白求恩", logo: "http://devhumor.com/wp-content/uploads/2012/04/devhumor.com_pointers.png"),
            School(id: 11111, name: "陕西机关二小", principal: "董存瑞", logo: "https://dn-kulebao.qbox.me/%252F3_0_1%252Fa%25E4%25B8%25AD%25E6%2596%2587%25E7%2585%25A7%25E7%2589%2587.jpg"),
            School(id: 22222, name: "大东亚国际班", principal: "齐白石", logo: "https://plus.google.com/u/1/_/focus/photos/private/AIbEiAIAAABECKbXuJDX09-XkwEiC3ZjYXJkX3Bob3RvKihjNmY3ODkyMWQ1MzBiMzc4Njk5NWI1YjU2MGM0ZDhmZjU5YWEwZDU2MAEuq9oMGe13z53gRtCfR-rLLrZHoQ?sz=64"),
            School(id: 33333, name: "健美操培训", principal: "张亚轩", logo: "data:image/png;base64,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")
        ]
    }
    
    func loadSchoolsFromStage(callback: ([School]) -> Void) -> Void {
        let engine = JSONHelper()
        engine.HTTPPostJSON("http://127.0.0.1:9000/employee_login.do", jsonObj: ["account_name": "operator", "password": "daishu"]){
            (data: String, error: String?) -> Void in
            if (error != nil) {
                println(error)
            } else {
                println(data)
                engine.HTTPGetJSONArray("http://127.0.0.1:9000/kindergarten") {
                    (data: [AnyObject], error: String?) -> Void in
                    if (error != nil) {
                        println(error)
                    } else {
                        let schools = data.map({
                            school -> School in
                            let id = school["school_id"] as Int
                            let name = school["name"] as String
                            let url = school["school_logo_url"] as String
                            return School(id: id, name: name, principal: "王二", logo: url)
                        })
                        callback(schools)
                    }
                }
                
            }
        }
    }
    
}
