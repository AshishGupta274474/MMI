//
//  AppDelegate.swift
//  MMI
//
//  Created by ashish gupta on 02/08/23.
//

import UIKit
import FirebaseCore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow.init(frame: UIScreen.main.bounds)
        
        let tabbar = MMITabBarController()
        let homeVC = HomeVC()
        let categoryVC = CategoryVC()
    
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "Home")?.resizeWithScaleAspectFitMode(to: 24.0), tag: 0)
        categoryVC.tabBarItem = UITabBarItem(title: "Category", image: UIImage(named: "Category")?.resizeWithScaleAspectFitMode(to: 24.0), tag: 1)
        
        tabbar.viewControllers = [homeVC, categoryVC]
        
        let mainVC = MMINavigationController(rootViewController: tabbar)
        window?.rootViewController = mainVC
        window?.makeKeyAndVisible()
        FirebaseApp.configure()
        return true
    }
}

