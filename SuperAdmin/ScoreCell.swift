//
//  ScoreCell.swift
//  SuperAdmin
//
//  Created by kpse on 9/28/14.
//  Copyright (c) 2014 cocobabys. All rights reserved.
//

import Foundation

class ScoreCell: UITableViewCell {
    
    @IBOutlet var name: UILabel!
    @IBOutlet var assignment: UILabel!
    @IBOutlet var assess: UILabel!
    @IBOutlet var chat: UILabel!
    @IBOutlet var news: UILabel!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func loadContent(teacher: Teacher) -> ScoreCell {
        self.name!.text = teacher.name
        let score = teacher.score!
        self.assignment!.text = "作业：\(score.assignment)"
        self.assess!.text = "在园评价：\(score.assess)"
        self.chat!.text = "互动：\(score.chat)"
        self.news!.text = "公告发布：\(score.news)"
        return self
    }
    
}