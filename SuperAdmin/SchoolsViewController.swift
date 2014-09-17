//
//  SchoolsViewController.swift
//  SuperAdmin
//
//  Created by kpse on 9/14/14.
//  Copyright (c) 2014 cocobabys. All rights reserved.
//

import UIKit

class SchoolsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView : UITableView!
    
    override func viewDidLoad() {
        self.tableView.registerClass(SchoolCell.self, forCellReuseIdentifier: "Cell")
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var  cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as SchoolCell
        
        
        //cell.titleLabel.text="\(ListArray.objectAtIndex(indexPath.item))"
        cell.id!.text = "132323"
        cell.name!.text="武警总队二小"
        cell.principal!.text="校长：白求恩"

        dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            var test =  UIImage(data: NSData(contentsOfURL: NSURL(string:"http://devhumor.com/wp-content/uploads/2012/04/devhumor.com_pointers.png")))
            dispatch_sync(dispatch_get_main_queue()!, {
                cell.imageView!.image = test
                cell.setNeedsLayout()
                cell.layoutIfNeeded()
            })
        })
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
}