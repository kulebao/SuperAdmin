//
//  ChargeViewController.swift
//  SuperAdmin
//
//  Created by kpse on 9/21/14.
//  Copyright (c) 2014 cocobabys. All rights reserved.
//

import UIKit

class ChargeViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource {
    var schools: [School]
    
    required init(coder aDecoder: NSCoder) {
        self.schools = []
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        DataLoader().loadChargeInfoFromStage(self.dataArrived)
    }
    
    func dataArrived(charges: [School]) -> Void {
        self.schools = charges
        dispatch_async(dispatch_get_main_queue(),{
            self.tableView.reloadData()
        });
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var  cell = tableView.dequeueReusableCellWithIdentifier("ChargeCell", forIndexPath: indexPath) as ChargeCell
        
        
        let model = self.schools[indexPath.item]
        
        return cell.loadContent(model)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.schools.count
    }
}