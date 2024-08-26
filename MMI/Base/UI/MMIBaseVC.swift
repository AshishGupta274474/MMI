//
//  MMIBaseVC.swift
//  MMI
//
//  Created by ashish gupta on 19/08/23.
//

import UIKit

class MMIBaseVC: UIViewController {

    override func loadView() {
        super.loadView()
        setUpView()
    }
    
    func setUpView(){
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItems = rightBarButtonItems()
    }
    
    func rightBarButtonItems() -> [UIBarButtonItem] {
        return []
    }
}
