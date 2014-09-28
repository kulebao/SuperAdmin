//
//  Score.swift
//  SuperAdmin
//
//  Created by kpse on 9/28/14.
//  Copyright (c) 2014 cocobabys. All rights reserved.
//

import Foundation

struct Score {
    let assignment: Int
    let assess: Int
    let chat: Int
    let news: Int
    
    init(assignment: Int, assess: Int, chat: Int, news: Int) {
        self.assignment = assignment
        self.assess = assess
        self.chat = chat
        self.news = news
    }
}