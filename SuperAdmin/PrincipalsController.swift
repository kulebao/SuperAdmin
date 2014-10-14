//
//  PrincipalsController.swift
//  SuperAdmin
//
//  Created by kpse on 9/29/14.
//  Copyright (c) 2014 cocobabys. All rights reserved.
//

import UIKit

class PrincipalsViewController: UITableViewController {
    var teachers: [Teacher]
    var spinner: Spinner!
    
    required init(coder aDecoder: NSCoder) {
        self.teachers = []
        super.init(coder: aDecoder)
    }
    
    override func viewDidAppear(animated: Bool) {
        spinner = Spinner(view: self.view)
        spinner.show("Loading...")
        DataLoader().loadEmployeesFromStage(self.dataArrived)

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
        let cell = tableView.dequeueReusableCellWithIdentifier("PrincipalCell", forIndexPath: indexPath) as PrincipalCell
        
        let model = self.teachers[indexPath.item]
        
        return cell.loadContent(model)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.teachers.count
    }
   
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        super.prepareForSegue(segue, sender: sender)
        if segue.identifier == "editTeacher"{
            let vc = segue.destinationViewController as EditTeatherController
            let t = sender! as PrincipalCell
            vc.teacher = t.teacher!
        }
        if segue.identifier == "addTeacher"{
            let vc = segue.destinationViewController as EditTeatherController
            vc.teacher = Teacher(name: "", school: 0, loginName: "", birthday: "", id: "3_1_1", phone: "1234321")
        }
    }
}
