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
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.sectionHeaderTopPadding = 0
        tableView.tableFooterView = nil
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.register(TaskTrackerTVC.self, forCellReuseIdentifier: String(describing: TaskTrackerTVC.self))
        return tableView
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

extension ExpenseTrackerVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
