//
//  ScoreViewController.swift
//  SuperAdmin
//
//  Created by kpse on 9/28/14.
//  Copyright (c) 2014 cocobabys. All rights reserved.
//

import UIKit

class ScoreViewController: UITableViewController {
    var teachers: [Teacher]
    var spinner: Spinner!
    
    required init(coder aDecoder: NSCoder) {
        self.teachers = []
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        spinner = Spinner(view: self.view)
        spinner.show("Loading...")
        DataLoader().loadScoreInfoFromStage(self.dataArrived)
    }
    
    func dataArrived(teachers: [Teacher]) {
        self.teachers = teachers
        dispatch_async(dispatch_get_main_queue(),{
            self.tableView.reloadData()
            self.spinner.hide()
        });
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("ScoreCell", forIndexPath: indexPath) as! ScoreCell
        
        let model = self.teachers[indexPath.item]
        
        return cell.loadContent(model)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.teachers.count
    }
}