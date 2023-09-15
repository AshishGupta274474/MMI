//
//  CategoryTVC.swift
//  MMI
//
//  Created by ashish gupta on 19/08/23.
//

import UIKit

class CategoryCVC: MMIBaseCVC {
    
    lazy var categoryImage = UIImageView()
    lazy var titleLable = UILabel()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        categoryImage.image = nil
        titleLable.text = ""
    }
    
    override func setUpViews() {
        super.setUpViews()
        
        categoryImage.contentMode = .scaleAspectFit
        categoryImage.translatesAutoresizingMaskIntoConstraints = false
        
        titleLable = UILabel()
        titleLable.translatesAutoresizingMaskIntoConstraints = false
        titleLable.font = UIFont.systemFont(ofSize: 14)
        titleLable.textAlignment = .center
        titleLable.textColor = UIColor.label
        titleLable.numberOfLines = 2
        
        let innerView = MMIView()
        innerView.addSubview(categoryImage)
        
        let stackView = UIStackView(arrangedSubviews: [innerView,titleLable])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
                
        let outerView = MMIView()
        outerView.backgroundColor = UIColor.secondarySystemBackground
        outerView.layer.cornerRadius = Constant.cornerRadiusStandard
        outerView.addSubview(stackView)
        contentView.addSubview(outerView)
        
        NSLayoutConstraint.activate([
            
            titleLable.heightAnchor.constraint(equalToConstant: 32.0),
            
            stackView.leadingAnchor.constraint(equalTo: outerView.leadingAnchor, constant: Constant.paddingSmall),
            stackView.trailingAnchor.constraint(equalTo: outerView.trailingAnchor, constant: -Constant.paddingSmall),
            stackView.topAnchor.constraint(equalTo: outerView.topAnchor, constant: Constant.paddingSmall),
            stackView.bottomAnchor.constraint(equalTo: outerView.bottomAnchor, constant: -Constant.stackSpacingStandard),
            
            // Outer View
            outerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constant.paddingxSmall),
            outerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constant.paddingxSmall),
            outerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constant.paddingxSmall),
            outerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constant.paddingxSmall),
            // imageView
            categoryImage.centerYAnchor.constraint(equalTo: innerView.centerYAnchor),
            categoryImage.centerXAnchor.constraint(equalTo: innerView.centerXAnchor),
            categoryImage.heightAnchor.constraint(equalTo: innerView.heightAnchor, multiplier: 0.5),
            categoryImage.widthAnchor.constraint(equalTo: categoryImage.heightAnchor),
            // Outer Stack view
        ])
        
    }
    
    func configureCell(ofCategory category: Category) {
        categoryImage.image = UIImage(named: category.title)?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        categoryImage.tintColor = UIColor.systemBlue
        titleLable.text = category.title
    }
    
}
