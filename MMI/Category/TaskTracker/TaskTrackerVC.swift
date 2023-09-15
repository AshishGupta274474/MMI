//
//  TaskTrackerVC.swift
//  MMI
//
//  Created by ashish gupta on 28/08/23.
//

import UIKit

class TaskTrackerVC: MMIBaseVC {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.register(TaskTrackerTVC.self, forCellReuseIdentifier: String(describing: TaskTrackerTVC.self))
        return tableView
    }()
    
    lazy var viewModel = TaskTrackerVM(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Task"
        view.backgroundColor = .systemBackground
    }
    
    override func setUpView() {
        super.setUpView()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTask))
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    // MARK: - Actions
    
    @objc
    func addTask() {
        let vc = TaskRecordVC()
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
}

extension TaskTrackerVC: TaskTrackerDelegate {
    func reloadData() {
        DispatchQueue.main.async {
            
        }
    }
}

extension TaskTrackerVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let tableViewCell = tableView.dequeueReusableCell(withIdentifier: String.init(describing: TaskTrackerTVC.self)) as? TaskTrackerTVC,
            let task = viewModel.dataSource[viewModel.sections[indexPath.section].rawValue]?[indexPath.row] else {
            return UITableViewCell()
        }
        tableViewCell.configureCell(with: task)
        return tableViewCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataSource[viewModel.sections[section].rawValue]?.count ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.sections[section].title
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return TaskTableHeaderView(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 48.0), taskPriority: viewModel.sections[section])
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 32.0
    }
    
}

extension TaskTrackerVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard
            let task = viewModel.dataSource[viewModel.sections[indexPath.section].rawValue]?[indexPath.row] else {
            return
        }
        task.selected = !task.selected
        tableView.reloadRows(at: [indexPath], with: .none)
    }
    
}
