//
//  DataService.swift
//  MMI
//
//  Created by ashish gupta on 15/09/23.
//

import Foundation

protocol ExpenseManagerProtocol: AnyObject {
    func add(_ expense: Expense)
    func remove(_ expenses: Expense)
    func refreshExpense()
    func fetchAllExpense() -> [Expense]
    
    var updateNotificationName: String { get }
}

extension ExpenseManagerProtocol {
    var updateNotificationName: String {
        return "notification.update.expense"
    }
}

class ExpenseManager: ExpenseManagerProtocol {
    
    private let key = "expense_data"
    
    public static let shared = ExpenseManager()
    private weak var dataService: DataServiceProtocol?
    
    private init(dataService: DataServiceProtocol = DataService.shared) {
        self.dataService = dataService
        self.expenses = []
    }
    
    private var expenses: [Expense] {
        didSet {
            print(expenses)
            NotificationCenter.default.post(name: Notification.Name(updateNotificationName), object: nil)
            self.dataService?.update(expenses, for: key)
        }
    }
    
    public func add(_ expense: Expense) {
        expenses.append(expense)
    }
    
    public func remove(_ expense: Expense) {
        self.expenses = expenses.filter({ currentExpense in
            return currentExpense.uuid != expense.uuid
        })
    }
    
    public func refreshExpense() {
        guard
            let expenses: [Expense] = dataService?.fetchAllValues(for: key) else {
            return
        }
        self.expenses = expenses
    }
    
    public func fetchAllExpense() -> [Expense] {
        return expenses
    }
}
