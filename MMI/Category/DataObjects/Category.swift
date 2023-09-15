//
//  Category.swift
//  MMI
//
//  Created by ashish gupta on 27/08/23.
//

import Foundation
import UIKit

enum Category {
    case food,expense,time,task
    
    var title: String {
        switch self {
        case .food: return String.foodTVCTitle
        case .expense: return String.expenseTVCTitle
        case .time: return String.timeTVCTitle
        case .task: return String.taskTVCTitle
        }
    }
    
    var description: String {
        switch self {
        case .food: return String.foodTVCDescription
        case .expense: return String.expenseTVCDescription
        case .time: return String.timeTVCDescription
        case .task: return String.taskTVCDescription
        }
    }
}
