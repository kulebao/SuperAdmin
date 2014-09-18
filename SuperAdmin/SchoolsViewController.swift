//
//  SchoolsViewController.swift
//  SuperAdmin
//
//  Created by kpse on 9/14/14.
//  Copyright (c) 2014 cocobabys. All rights reserved.
//

import UIKit

class SchoolsViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource {
    
    var schools: [School]
    
    required init(coder aDecoder: NSCoder) {
        self.schools = []
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        DataLoader().loadSchoolsFromStage(self.dataArrived)
    }
    
    func dataArrived(schools: [AnyObject]) -> Void {
      
           self.schools = schools.map({
                   (school: AnyObject) -> School in
                   let id = school["school_id"] as Int
                   let name = school["name"] as String
                   let url = school["school_logo_url"] as String
                   return School(id: id, name: name, principal: "王二", logo: url)
               })
      
           dispatch_async(dispatch_get_main_queue(),{
                self.tableView.reloadData()
               });
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var  cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath) as SchoolCell
        
 
        let model = self.schools[indexPath.item]

        return cell.loadContent(model)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.schools.count
    }
    
}