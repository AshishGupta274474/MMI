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
    
    init(delegate: TaskTrackerDelegate? = nil) {
        self.delegate = delegate
    }
}
