//
//  TimeTrackerVC.swift
//  MMI
//
//  Created by ashish gupta on 02/08/23.
//

import UIKit
import Charts

class TimeTrackerVC: MMIBaseVC {

    lazy var segment = {
        let segment = UISegmentedControl(items: ["Day","Week","Month","6 Month", "Year"])
        segment.selectedSegmentIndex = 0
        return segment
    }()
    
    lazy var tableView =  UITableView()
    lazy var stackView = UIStackView()
    lazy var headerView = UIView()
    
    var viewModel : CategoryVM?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Time Tracker"
        UILabel.appearance(whenContainedInInstancesOf: [UISegmentedControl.self]).numberOfLines = 0
    }
    
    override func setUpView() {
        super.setUpView()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addRecord))

        view.addSubview(segment)
            
        stackView.addArrangedSubview(segment)
        stackView.distribution = .fill
        stackView.spacing = Constant.stackSpacingStandard
        
        headerView.addSubview(stackView)
        
        tableView.tableHeaderView = headerView
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        segment.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            
            segment.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            
            stackView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: Constant.paddingStandard),
            stackView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -Constant.paddingStandard),
            stackView.topAnchor.constraint(equalTo: headerView.topAnchor, constant: Constant.paddingSmall),
            stackView.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -Constant.paddingSmall),
            
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        if let header = tableView.tableHeaderView {
            let newSize = header.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
            header.frame.size.height = newSize.height
            header.frame.size.width = UIScreen.main.bounds.width
        }
    }
    
    // MARK: - Actions
    
    @objc
    func addRecord() {
        present(RecordTimeVC(), animated: true)
    }

}

extension TimeTrackerVC : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension TimeTrackerVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
