//
//  CategoryVC.swift
//  MMI
//
//  Created by ashish gupta on 03/08/23.
//

import UIKit

class CategoryVC: MMIBaseVC {
    
    var myCollectionView: UICollectionView!
    var viewModel : CategoryVM?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = CategoryVM(delegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationItem.title = String.categoryVCTitle
    }
    
    
    override func setUpView() {
        super.setUpView()
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let width = (UIScreen.main.bounds.width - 4*Constant.paddingSmall)/4
        layout.itemSize = CGSize(width: width, height: width)
        
        myCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        myCollectionView?.register(CategoryCVC.self, forCellWithReuseIdentifier: String(describing: CategoryCVC.self))
        myCollectionView?.backgroundColor = UIColor.clear
        
        myCollectionView?.dataSource = self
        myCollectionView?.delegate = self
        
        view.addSubview(myCollectionView ?? UICollectionView())
        
        NSLayoutConstraint.activate([
            myCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constant.paddingSmall),
            myCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            myCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            myCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constant.paddingSmall)
        ])
        
    }
}

extension CategoryVC : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard
            let viewModel = self.viewModel else {
            return
        }
        viewModel.categorySelected(at: indexPath.row)
    }
}

extension CategoryVC : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.categories.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let collectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CategoryCVC.self), for: indexPath) as? CategoryCVC,
            let viewModel = viewModel else {
            return UICollectionViewCell()
        }
        collectionViewCell.configureCell(ofCategory: viewModel.categories[indexPath.row])
        return collectionViewCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}

extension CategoryVC : CategoryVCDelegate {
    func launch(category: Category) {
        var page: UIViewController?
        
        switch category {
        case .food : page = FoodTackerVC()
        case .expense: page = ExpenseTrackerVC()
        case .time: page = TimeTrackerVC()
        case .task: page = TaskTrackerVC()
        }
        
        guard
            let page = page else {
            return
        }
        navigationController?.pushViewController(page, animated: true)
    }
}

