//
//  TaskCategory.swift
//  MMI
//
//  Created by ashish gupta on 27/08/23.
//

import Foundation
import UIKit

enum TaskPriority: String {
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

