//
//  ExpenseTrackerVM.swift
//  MMI
//
//  Created by ashish gupta on 15/09/23.
//

import Foundation
import UIKit

protocol ExpenseTrackerDelegate : AnyObject {
    func reloadData()
}

class ExpenseTrackerVM {
    
    var sections: [ExpenseCategory] = []
    var dataSource: [String:[String:Int]] = [:]
    weak var delegate: ExpenseTrackerDelegate?
    weak var expenseManager: ExpenseManagerProtocol?
    
    init(delegate: ExpenseTrackerDelegate? = nil, expenseManager: ExpenseManagerProtocol = ExpenseManager.shared) {
        self.delegate = delegate
        self.expenseManager = expenseManager
        NotificationCenter.default.addObserver(self, selector: #selector(expenseListRefereshed), name: Notification.Name(expenseManager.updateNotificationName), object: nil)
        expenseManager.refreshExpense()
    }
    
    @objc
    func expenseListRefereshed() {
        expenseManager?.fetchAllExpense().forEach({ expense in
            
            if !sections.contains(expense.category) {
                sections.append(expense.category)
            }
            
            var categoryExpense: [String:Int] = dataSource[expense.category.title] ?? [:]
            categoryExpense[expense.category.type] = categoryExpense[expense.category.type] ?? 0 + expense.value
            dataSource[expense.category.title] = categoryExpense
        })
        delegate?.reloadData()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
