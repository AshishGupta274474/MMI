//
//  MMITabBarControllerViewController.swift
//  MMI
//
//  Created by ashish gupta on 02/08/23.
//

import UIKit

class MMITabBarController: UITabBarController,UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.delegate = self
    }
}
