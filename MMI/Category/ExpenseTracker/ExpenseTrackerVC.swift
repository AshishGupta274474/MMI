//
//  ExpenseTrackerVC.swift
//  MMI
//
//  Created by ashish gupta on 02/08/23.
//

import UIKit

class ExpenseTrackerVC: MMIBaseVC {
    
    lazy var segment = {
        let segment = UISegmentedControl(items: ["Month","Year"])
        segment.selectedSegmentIndex = 0
        segment.translatesAutoresizingMaskIntoConstraints = false
        return segment
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = []
        view.backgroundColor = UIColor.systemBackground
        self.title = "Expenses Tracker"
    }
    
    override func setUpView() {
        super.setUpView()
        
        view.addSubview(segment)
        
        NSLayoutConstraint.activate([
            segment.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            segment.topAnchor.constraint(equalTo: view.topAnchor, constant: Constant.paddingSmall),
        ])
    }
}
