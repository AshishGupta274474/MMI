//
//  TaskCategory.swift
//  MMI
//
//  Created by ashish gupta on 27/08/23.
//

import Foundation
import UIKit

enum TaskPriority: String , Codable {
    case high = "priority_high"
    case low = "priority_low"
    
    var title: String {
        switch self {
        case .high: return "High"
        case .low: return "Low"
        }
    }
    
    var colorCode: UIColor {
        switch self {
        case .high: return .systemRed
        case .low: return .systemGreen
        }
    }
}

class Task : Codable {
    var priority: TaskPriority
    var value: String
    var completed: Bool
    var uuid: String
    var date : Date
    var selected: Bool
    
    init(priority: TaskPriority ,value: String) {
        self.uuid = UUID().uuidString
        self.priority = priority
        self.value = value
        self.completed = false
        self.selected = false
        self.date = Date.now
    }
    
    enum CodingKeys: String, CodingKey {
        case priority
        case value
        case completed
        case uuid
        case date
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        priority = try container.decode(TaskPriority.self, forKey: .priority)
        value = try container.decode(String.self, forKey: .value)
        completed = try container.decode(Bool.self, forKey: .completed)
        uuid = try container.decode(String.self, forKey: .uuid)
        date = try container.decode(Date.self, forKey: .date)
        selected = false
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(priority, forKey: .priority)
        try container.encode(value, forKey: .value)
        try container.encode(completed, forKey: .completed)
        try container.encode(uuid, forKey: .uuid)
        try container.encode(date, forKey: .date)
    }
}

