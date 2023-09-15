//
//  ScheduleItem.swift
//  MMI
//
//  Created by ashish gupta on 03/09/23.
//

import Foundation

struct ScheduleItem : Equatable {
    var name : String
    var startTime : Date
    var stopTime : Date
    var reuccurring : Bool
}
