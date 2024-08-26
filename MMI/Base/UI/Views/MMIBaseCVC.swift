//
//  MMIBaseCVC.swift
//  MMI
//
//  Created by ashish gupta on 15/09/23.
//

import UIKit

class MMIBaseCVC: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpViews()
    }
    
    func setUpViews() {}
}
