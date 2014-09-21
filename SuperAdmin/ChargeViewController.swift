//
//  ChargeViewController.swift
//  SuperAdmin
//
//  Created by kpse on 9/21/14.
//  Copyright (c) 2014 cocobabys. All rights reserved.
//

import UIKit

class ChargeViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource {
    var charges: [Charge]
    
    required init(coder aDecoder: NSCoder) {
        self.charges = [Charge(school: 123, member: 100, video: 200)]
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
//        DataLoader().loadSchoolsFromStage(self.dataArrived)
    }
    
    func dataArrived(schools: [School]) -> Void {
//        self.cha = schools
        dispatch_async(dispatch_get_main_queue(),{
            self.tableView.reloadData()
        });
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var  cell = tableView.dequeueReusableCellWithIdentifier("ChargeCell", forIndexPath: indexPath) as ChargeCell
        
        
        let model = self.charges[indexPath.item]
        
        return cell.loadContent(model)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.charges.count
    }
}