//
//  JSONHelper.swift
//  SuperAdmin
//
//  Created by kpse on 9/18/14.
//  Copyright (c) 2014 cocobabys. All rights reserved.
//

import Foundation

class JSONHelper {
    func HTTPsendRequest(request: NSMutableURLRequest,
        callback: (String, String?) -> Void) {
            let task = NSURLSession.sharedSession()
                .dataTaskWithRequest(request) {
                    (data, response, error) in
                    if (error != nil) {
                        callback("", error.localizedDescription)
                    } else {
                        callback(NSString(data: data,
                            encoding: NSUTF8StringEncoding), nil)
                    }
            }
            
            task.resume()
    }
    func JSONStringify(jsonObj: AnyObject) -> String {
        var e: NSError?
        let jsonData: NSData! = NSJSONSerialization.dataWithJSONObject(
            jsonObj,
            options: NSJSONWritingOptions(0),
            error: &e)
        if e != nil {
            return ""
        } else {
            return NSString(data: jsonData, encoding: NSUTF8StringEncoding)
        }
    }
    
    
    func JSONParseDict(jsonString:String) -> Dictionary<String, AnyObject> {
        var e: NSError?
        var data: NSData = jsonString.dataUsingEncoding(
            NSUTF8StringEncoding)!
        var jsonObj = NSJSONSerialization.JSONObjectWithData(
            data,
            options: NSJSONReadingOptions(0),
            error: &e) as Dictionary<String, AnyObject>
        if (e != nil) {
            return Dictionary<String, AnyObject>()
        } else {
            return jsonObj
        }
    }
    func JSONParseArray(jsonString: String) -> [AnyObject] {
        var e: NSError?
        var data: NSData!=jsonString.dataUsingEncoding(NSUTF8StringEncoding)
        var jsonObj = NSJSONSerialization.JSONObjectWithData(
            data,
            options: NSJSONReadingOptions(0),
            error: &e) as [AnyObject]
        if e != nil {
            return []
        } else {
            return jsonObj
        }
    }
    
    func HTTPGetJSON(
        url: String,
        callback: (Dictionary<String, AnyObject>, String?) -> Void) {
            var request = NSMutableURLRequest(URL: NSURL(string: url))
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            HTTPsendRequest(request) {
                (data: String, error: String?) in
                if (error != nil) {
                    callback(Dictionary<String, AnyObject>(), error)
                } else {
                    var jsonObj = self.JSONParseDict(data)
                    callback(jsonObj, nil)
                }
            }
    }
    
    func HTTPGetJSONArray(
        url: String,
        callback: ([AnyObject], String?) -> Void) {
            var request = NSMutableURLRequest(URL: NSURL(string: url))
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            HTTPsendRequest(request) {
                (data: String, error: String?) in
                if (error != nil) {
                    callback([], error)
                } else {
                    var jsonObj = self.JSONParseArray(data)
                    callback(jsonObj, nil)
                }
            }
    }
    func HTTPPostJSON(url: String,
        jsonObj: AnyObject,
        callback: (String, String?) -> Void) {
            var request = NSMutableURLRequest(URL: NSURL(string: url))
            request.HTTPMethod = "POST"
            request.addValue("application/json",
            forHTTPHeaderField: "Content-Type")
            let jsonString = JSONStringify(jsonObj)
            let data: NSData = jsonString.dataUsingEncoding(
                NSUTF8StringEncoding)!
            request.HTTPBody = data
            HTTPsendRequest(request, callback)
    }
}