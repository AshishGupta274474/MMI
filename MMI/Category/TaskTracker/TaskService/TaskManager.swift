//
//  DataService.swift
//  MMI
//
//  Created by ashish gupta on 15/09/23.
//

import Foundation

protocol TaskManagerProtol: AnyObject {
    func add(_ task: Task)
    func update(tasks updatedTasks: [Task])
    func remove(tasks updatedTasks: [Task])
    func refreshTask()
}

class TaskManager: TaskManagerProtol {
    
    private let key = "task_data"
    public static let updateNotificationName = "notification.update.task"
    
    public static let shared = TaskManager()
    private weak var dataService: DataServiceProtocol?
    
    private init(dataService: DataServiceProtocol = DataService.shared) {
        self.dataService = dataService
        self.tasks = []
    }
    
    private(set) var tasks: [Task] {
        didSet {
            NotificationCenter.default.post(name: Notification.Name(TaskManager.updateNotificationName), object: nil)
            self.dataService?.update(tasks, for: key)
        }
    }
    
    public func add(_ task: Task) {
        tasks.append(task)
    }
    
    public func remove(tasks updatedTasks: [Task]) {
        var resultTask: [Task] = []
        tasks.forEach { currentTask in
            if !updatedTasks.contains(where: { updatedTask in
                return currentTask == updatedTask
            }){
                resultTask.append(currentTask)
            }
        }
        tasks = resultTask
    }
    
    public func update(tasks updatedTasks: [Task]) {
        var resultTask: [Task] = []
        tasks.forEach { currentTask in
            if !updatedTasks.contains(where: { updatedTask in
                return currentTask == updatedTask
            }){
                resultTask.append(currentTask)
            }
        }
        tasks.append(contentsOf: updatedTasks)
        tasks = resultTask
    }
    
    public func refreshTask() {
        guard
            let tasks: [Task] = dataService?.fetchAllValues(for: key) else {
            return
        }
        self.tasks = tasks
    }
}
