//
//  TaskTrackerVC.swift
//  MMI
//
//  Created by ashish gupta on 28/08/23.
//

import UIKit

class TaskTrackerVC: MMIBaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Task"
        view.backgroundColor = .systemBackground

        // Do any additional setup after loading the view.
    }
    
    override func setUpView() {
        super.setUpView()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTask))
        
        let search = UISearchController(searchResultsController: nil)
        search.delegate = self
        search.searchBar.delegate = self
        navigationItem.searchController = search
    }
    
    // MARK: - Actions
    
    @objc
    func addTask() {
        let vc = TaskRecordVC()
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
}

extension TaskTrackerVC: UISearchControllerDelegate, UISearchBarDelegate {
    
}
