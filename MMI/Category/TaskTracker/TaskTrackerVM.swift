//
//  TaskTrackerVM.swift
//  MMI
//
//  Created by ashish gupta on 15/09/23.
//

import Foundation

protocol TaskTrackerDelegate : AnyObject {
    func reloadData()
}

class TaskTrackerVM {
    
    var sections = [TaskPriority.high,TaskPriority.low]
    var dataSource: [String:[Task]] = [TaskPriority.high.rawValue : [], TaskPriority.low.rawValue : []]
    weak var delegate: TaskTrackerDelegate?
    weak var taskManager: TaskManagerProtocol?
    
    init(delegate: TaskTrackerDelegate? = nil, taskManager: TaskManagerProtocol = TaskManager.shared) {
        self.delegate = delegate
        self.taskManager = taskManager
        
        NotificationCenter.default.addObserver(self, selector: #selector(taskListRefereshed), name: Notification.Name(taskManager.updateNotificationName), object: nil)

        taskManager.refreshTask()
    }
    
    @objc
    func taskListRefereshed() {
        dataSource[TaskPriority.high.rawValue] = taskManager?.fetchAllTask().filter({ task in
            return task.priority == .high && !task.completed
        })
        dataSource[TaskPriority.low.rawValue] = taskManager?.fetchAllTask().filter({ task in
            return task.priority == .low && !task.completed
        })
        
        delegate?.reloadData()
    }
}
