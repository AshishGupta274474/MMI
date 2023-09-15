//
//  TaskTableHeaderView.swift
//  MMI
//
//  Created by ashish gupta on 15/09/23.
//

import UIKit

class TaskTableHeaderView: UIView {
    
    convenience init(frame: CGRect, taskPriority: TaskPriority) {
        self.init(frame: frame)
        
        let outerView = MMIView()
        outerView.backgroundColor = .secondarySystemBackground
        outerView.layer.cornerRadius = Constant.cornerRadiusStandard
        
        let colorView = MMIView()
        colorView.backgroundColor = taskPriority.colorCode
        colorView.layer.cornerRadius = Constant.cornerRadiusSmall
        
        let titleView = UILabel()
        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleView.text = taskPriority.title
        
        outerView.addSubview(colorView)
        outerView.addSubview(titleView)
        addSubview(outerView)
        
        NSLayoutConstraint.activate([
            outerView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: Constant.paddingSmall),
            outerView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -Constant.paddingSmall),
            outerView.topAnchor.constraint(equalTo: topAnchor),
            outerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            colorView.leadingAnchor.constraint(equalTo: outerView.leadingAnchor, constant: Constant.paddingSmall),
            colorView.widthAnchor.constraint(equalToConstant: Constant.paddingSmall),
            colorView.heightAnchor.constraint(equalToConstant: Constant.paddingStandard),
            colorView.centerYAnchor.constraint(equalTo: outerView.centerYAnchor),
            
            titleView.centerYAnchor.constraint(equalTo: colorView.centerYAnchor),
            titleView.leadingAnchor.constraint(equalTo: colorView.trailingAnchor, constant: Constant.paddingxSmall),
            titleView.trailingAnchor.constraint(equalTo: outerView.trailingAnchor, constant: -Constant.paddingSmall),
        ])
    }

}
