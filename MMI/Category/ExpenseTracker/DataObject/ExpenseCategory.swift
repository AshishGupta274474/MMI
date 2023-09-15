//
//  ExpenseCategory.swift
//  MMI
//
//  Created by ashish gupta on 03/09/23.
//

import UIKit

enum ExpenseCarCategory: String {
    case fuel = "Fuel"
    case repair = "Repair"
    case insurance = "Insurance"
    
    var title: String { return "Car" }
    var type: String { return rawValue }
    var colorCode: UIColor { return .systemRed }
}

enum ExpenseFoodCategory: String {
    case dining = "Dinning"
    case orderIn = "Order"
    case groceries = "Groceries"
    
    var title: String { return "Food" }
    var type: String { return rawValue }
    var colorCode: UIColor { return .systemBlue }
}

enum ExpenseLesuireCategory: String {
    case outings = "Outings"
    case others = "Others"
    
    var title: String { return "Lesuire" }
    var type: String { return rawValue }
    var colorCode: UIColor { return .systemPink }
}

enum ExpenseTravelCategory: String {
    case domestic = "Domestic"
    case international = "International"
    
    var title: String { return "Travel" }
    var type: String { return rawValue }
    var colorCode: UIColor { return .systemMint }
}

enum ExpenseCommuteCategory: String {
    case cabs = "Cabs"
    case flights = "Flights"
    
    var title: String { return "Commute" }
    var type: String { return rawValue }
    var colorCode: UIColor { return .systemIndigo }
}

enum ExpenseShoppingCategory: String {
    case clothes = "Clothes"
    case gadgets = "Gadgets"
    
    var title: String { return "Shopping" }
    var type: String { return rawValue }
    var colorCode: UIColor { return .systemTeal }
}

enum ExpenseSelfCareCategory: String {
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

enum ExpenseHomeCategory: String {
    case rent = "Rent"
    case utilities = "Utilities"
    case electronics = "Electronics"
    case maintenance = "Maintenance"
    case others = "Others"
    
    var title: String { return "Home" }
    var type: String { return rawValue }
    var colorCode: UIColor { return .systemYellow }
}

enum ExpenseInvestmentCategory: String {
    case lifeInsurance = "lifeInsurance"
    case healthInsurance = "healthInsurance"
    case indianStocks = "indianStocks"
    case usStocks = "usStocks"
    case others = "Others"
    
    var title: String { return "Home" }
    var type: String { return rawValue }
    var colorCode: UIColor { return .systemGreen }
}
