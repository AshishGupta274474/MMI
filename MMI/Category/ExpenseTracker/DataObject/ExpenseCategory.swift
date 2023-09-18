//
//  ExpenseCategory.swift
//  MMI
//
//  Created by ashish gupta on 03/09/23.
//

import UIKit

class Expense: Codable {
    var category: ExpenseCategory
    var value: Int
    var date: Date
    var uuid: String
    
    init(category: ExpenseCategory, value: Int, uuid: String, date: Date) {
        self.category = category
        self.value = value
        self.uuid = uuid
        self.date = date
    }
    
    static func ==(lhs: Expense, rhs: Expense) -> Bool {
        return lhs.uuid == rhs.uuid
    }
}

enum ExpenseCategory: Codable, Hashable {
    case car(ExpenseCarCategory)
    case food(ExpenseFoodCategory)
    case lesuire(ExpenseLesuireCategory)
    case travel(ExpenseTravelCategory)
    case commute(ExpenseCommuteCategory)
    case shopping(ExpenseShoppingCategory)
    case selfcare(ExpenseSelfCareCategory)
    case home(ExpenseHomeCategory)
    case investment(ExpenseInvestmentCategory)
    
    var colorCode: UIColor {
        switch self {
        case .car(let value): return value.colorCode
        case .food(let value): return value.colorCode
        case .lesuire(let value): return value.colorCode
        case .travel(let value): return value.colorCode
        case .commute(let value): return value.colorCode
        case .shopping(let value): return value.colorCode
        case .selfcare(let value): return value.colorCode
        case .home(let value): return value.colorCode
        case .investment(let value): return value.colorCode
        }
    }
    
    var title: String {
        switch self {
        case .car(let value): return value.title
        case .food(let value): return value.title
        case .lesuire(let value): return value.title
        case .travel(let value): return value.title
        case .commute(let value): return value.title
        case .shopping(let value): return value.title
        case .selfcare(let value): return value.title
        case .home(let value): return value.title
        case .investment(let value): return value.title
        }
    }
    
    var type: String {
        switch self {
        case .car(let value): return value.type
        case .food(let value): return value.type
        case .lesuire(let value): return value.type
        case .travel(let value): return value.type
        case .commute(let value): return value.type
        case .shopping(let value): return value.type
        case .selfcare(let value): return value.type
        case .home(let value): return value.type
        case .investment(let value): return value.type
        }
    }
}

enum ExpenseCarCategory: String,Codable {
    case fuel = "Fuel"
    case repair = "Repair"
    case insurance = "Insurance"
    
    var title: String { return "Car" }
    var type: String { return rawValue }
    var colorCode: UIColor { return .systemRed }
}

enum ExpenseFoodCategory: String,Codable {
    case dining = "Dinning"
    case orderIn = "Order"
    case groceries = "Groceries"
    
    var title: String { return "Food" }
    var type: String { return rawValue }
    var colorCode: UIColor { return .systemBlue }
}

enum ExpenseLesuireCategory: String,Codable {
    case outings = "Outings"
    case others = "Others"
    
    var title: String { return "Lesuire" }
    var type: String { return rawValue }
    var colorCode: UIColor { return .systemPink }
}

enum ExpenseTravelCategory: String,Codable {
    case domestic = "Domestic"
    case international = "International"
    
    var title: String { return "Travel" }
    var type: String { return rawValue }
    var colorCode: UIColor { return .systemMint }
}

enum ExpenseCommuteCategory: String,Codable {
    case cabs = "Cabs"
    case flights = "Flights"
    
    var title: String { return "Commute" }
    var type: String { return rawValue }
    var colorCode: UIColor { return .systemIndigo }
}

enum ExpenseShoppingCategory: String,Codable {
    case clothes = "Clothes"
    case gadgets = "Gadgets"
    
    var title: String { return "Shopping" }
    var type: String { return rawValue }
    var colorCode: UIColor { return .systemTeal }
}

enum ExpenseSelfCareCategory: String,Codable {
    case supplements = "supplements"
    case gym = "gym"
    case hairProducts = "Hair Products"
    case bodyProducts = "Body Products"
    case medicine = "Medicines"
    case others = "Others"
    
    var title: String { return "Self Care" }
    var type: String { return rawValue }
    var colorCode: UIColor { return .systemOrange }
}

enum ExpenseHomeCategory: String,Codable {
    case rent = "Rent"
    case utilities = "Utilities"
    case electronics = "Electronics"
    case maintenance = "Maintenance"
    case others = "Others"
    
    var title: String { return "Home" }
    var type: String { return rawValue }
    var colorCode: UIColor { return .systemYellow }
}

enum ExpenseInvestmentCategory: String,Codable {
    case lifeInsurance = "lifeInsurance"
    case healthInsurance = "healthInsurance"
    case indianStocks = "indianStocks"
    case usStocks = "usStocks"
    case others = "Others"
    
    var title: String { return "Home" }
    var type: String { return rawValue }
    var colorCode: UIColor { return .systemGreen }
}
