//
//  TimeCategory.swift
//  MMI
//
//  Created by ashish gupta on 27/08/23.
//

import Foundation
import UIKit

enum TimeCategory: String {
    
    case sleep = "Sleep"
    case commute = "Commute"
    case office = "Office"
    case workout = "Workout"
    case leisure = "Lesuire"
    case read = "Read"
    case work = "Work"
    case miscelleaneous = "Miscelleaneous"
    
    var title: String {
        return rawValue
    }
    
    var targetValue: Float {
        switch self {
        case .sleep: return 8.0
        case .commute: return 1.0
        case .office: return 8.0
        case .workout: return 1.0
        case .leisure: return 1.0
        case .read: return 0.5
        case .work: return 2.0
        case .miscelleaneous: return 2.5
        }
    }
    
    var colorCode: UIColor {
        switch self {
        case .sleep: return UIColor.systemGreen
        case .commute: return UIColor.systemPink
        case .office: return UIColor.systemTeal
        case .workout: return UIColor.systemOrange
        case .leisure: return UIColor.systemRed
        case .read: return UIColor.systemIndigo
        case .work: return UIColor.systemCyan
        case .miscelleaneous: return UIColor.systemGray
        }
    }
}

