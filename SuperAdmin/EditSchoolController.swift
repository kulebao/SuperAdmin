//
//  EditSchoolController.swift
//  SuperAdmin
//
//  Created by kpse on 10/11/14.
//  Copyright (c) 2014 cocobabys. All rights reserved.
//

import Foundation

class EditSchoolController: UIViewController {
    var school : School!

    @IBOutlet weak var schoolId: UILabel!
    override func viewDidLoad() {
        self.schoolId!.text = "\(self.school.id)"
    }
}