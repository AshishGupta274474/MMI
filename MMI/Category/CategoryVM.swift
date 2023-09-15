//
//  CategoryVM.swift
//  MMI
//
//  Created by ashish gupta on 19/08/23.
//

import Foundation
import UIKit

protocol CategoryVCDelegate : AnyObject {
    func launch(category: Category)
}

class CategoryVM {
    
    weak var delegate: CategoryVCDelegate?
    
    let categories = [Category.food,Category.expense,Category.time,Category.task]
    
    init(delegate : CategoryVCDelegate) {
        self.delegate = delegate
    }
    
    func categorySelected(at index: Int) {
        delegate?.launch(category: categories[index])
    }
    
}
