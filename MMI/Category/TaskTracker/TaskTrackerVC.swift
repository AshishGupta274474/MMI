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
        tableView.sectionHeaderTopPadding = 0
        tableView.tableFooterView = nil
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.register(TaskTrackerTVC.self, forCellReuseIdentifier: String(describing: TaskTrackerTVC.self))
        return tableView
    }()
    
    lazy var viewModel = TaskTrackerVM(delegate: self)
    
    override func setUpView() {
        super.setUpView()
        
        title = "Task"
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    override func rightBarButtonItems() -> [UIBarButtonItem] {
        var items = super.rightBarButtonItems()
        items.append(contentsOf: [
            UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTask))
        ])
        return items
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
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
}

extension TaskTrackerVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let tableViewCell = tableView.dequeueReusableCell(withIdentifier: String.init(describing: TaskTrackerTVC.self)) as? TaskTrackerTVC,
            let task = viewModel.dataSource[viewModel.sections[indexPath.section]]?[indexPath.row] else {
            return UITableViewCell()
        }
        tableViewCell.configureCell(with: task)
        return tableViewCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataSource[viewModel.sections[section]]?.count ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.dataSource.count
    }
        
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return TaskTableHeaderView(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 48.0), taskPriority: viewModel.sections[section])
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView.init(frame: .zero)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 32.0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0
    }
    
}

extension TaskTrackerVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive,
                                        title: "remove") { [weak self] (_, _, completionHandler) in
            guard
                let self = self,
                let task = viewModel.dataSource[viewModel.sections[indexPath.section]]?[indexPath.row] else {
                completionHandler(false)
                return
            }
            UINotificationFeedbackGenerator().notificationOccurred(.warning)

            self.viewModel.remove(tasks: [task])
            completionHandler(true)
        }
        
        deleteAction.image = UIImage(named: "trash")?.withRenderingMode(.alwaysTemplate)
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .normal,
                                        title: "") { [weak self] (_, _, completionHandler) in
            guard
                let self = self,
                let task = viewModel.dataSource[viewModel.sections[indexPath.section]]?[indexPath.row] else {
                completionHandler(false)
                return
            }
            UINotificationFeedbackGenerator().notificationOccurred(.success)
            self.viewModel.remove(tasks: [task])
            completionHandler(true)
        }
        
        deleteAction.backgroundColor = .systemGreen
        deleteAction.image = UIImage(named: "tick")?.withRenderingMode(.alwaysTemplate)
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}
