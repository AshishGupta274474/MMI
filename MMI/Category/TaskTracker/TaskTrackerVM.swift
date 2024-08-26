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
    
    var sections = TaskPriority.allCases
    var dataSource: [TaskPriority:[Task]] = [:]
    weak var delegate: TaskTrackerDelegate?
    weak var taskManager: TaskManagerProtocol?
    
    init(delegate: TaskTrackerDelegate? = nil, taskManager: TaskManagerProtocol = TaskManager.shared) {
        self.delegate = delegate
        self.taskManager = taskManager
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(taskListRefereshed),
            name: Notification.Name(taskManager.updateNotificationName),
            object: nil
        )

        taskManager.refreshTask()
    }
    
    @objc
    func taskListRefereshed() {
        TaskPriority.allCases.forEach { [weak self] taskPriority in
            guard let self = self else { return }
            self.dataSource[taskPriority, default: []] = taskManager?.fetchAllTask().filter({ task in
                return task.priority == taskPriority && !task.completed
            }) ?? []
        }
        delegate?.reloadData()
    }
    
    func remove(tasks: [Task]) {
        taskManager?.remove(tasks)
    }
    
    func complete(tasks: [Task]) {
        tasks.forEach { task in
            task.completed = true
        }
        taskManager?.update(tasks:tasks)
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
