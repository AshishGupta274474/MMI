//
//  TaskTrackerTVC.swift
//  MMI
//
//  Created by ashish gupta on 15/09/23.
//

import Foundation
import UIKit

class TaskTrackerTVC: MMIBaseTVC {
    
    lazy var selectionImageView = UIImageView()
    
    lazy var title: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .left
        title.numberOfLines = 0
        return title
    }()
        
    override func setUpViews() {
        super.setUpViews()
        
        selectionImageView.translatesAutoresizingMaskIntoConstraints = false
        selectionImageView.contentMode = .scaleAspectFit
        
        contentView.addSubview(selectionImageView)
        contentView.addSubview(title)
        
        NSLayoutConstraint.activate([
            selectionImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constant.paddingStandard),
            selectionImageView.centerYAnchor.constraint(equalTo: title.centerYAnchor),
            selectionImageView.heightAnchor.constraint(equalTo: selectionImageView.widthAnchor),
            selectionImageView.heightAnchor.constraint(equalToConstant: Constant.avatarSizeStandard/2),
            
            title.leadingAnchor.constraint(equalTo: selectionImageView.trailingAnchor, constant: Constant.paddingSmall),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constant.paddingStandard),
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constant.paddingStandard),
            title.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constant.paddingStandard),
        ])
        
    }
    
    func configureCell(with task: Task) {
        title.text = task.value
        selectionImageView.image = (task.selected ? UIImage.init(named:"SelectedCircle") : UIImage.init(named: "UnSelectedCircle"))?.withRenderingMode(.alwaysTemplate)
        selectionImageView.tintColor = task.selected ? .systemBlue : .systemGray
    }
}
