//
//  DataService.swift
//  MMI
//
//  Created by ashish gupta on 15/09/23.
//

import Foundation

protocol TaskManagerProtocol: AnyObject {
    func add(_ task: Task)
    func update(tasks updatedTasks: [Task])
    func remove(_ tasks: [Task])
    func refreshTask()
    func fetchAllTask() -> [Task]
    
    var updateNotificationName: String { get }
}

extension TaskManagerProtocol {
    var updateNotificationName: String {
        return "notification.update.task"
    }
}

class TaskManager: TaskManagerProtocol {
    
    private let key = "task_data"
    
    public static let shared = TaskManager()
    private weak var dataService: DataServiceProtocol?
    
    private init(dataService: DataServiceProtocol = DataService.shared) {
        self.dataService = dataService
        self.tasks = []
    }
    
    private var tasks: [Task] {
        didSet {
            self.dataService?.update(tasks, for: key)
            NotificationCenter.default.post(name: Notification.Name(updateNotificationName), object: nil)
        }
    }
    
    public func add(_ task: Task) {
        tasks.append(task)
    }
    
    public func remove(_ tasks: [Task]) {
        var resultTask: [Task] = []
        self.tasks.forEach { currentTask in
            if !tasks.contains(where: { task in
                return currentTask == task
            }){
                resultTask.append(currentTask)
            }
        }
        self.tasks = resultTask
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
    
    public func fetchAllTask() -> [Task] {
        return tasks
    }
}
