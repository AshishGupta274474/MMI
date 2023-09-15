//
//  MMIBaseTVC.swift
//  MMI
//
//  Created by ashish gupta on 19/08/23.
//

import UIKit

class MMIBaseTVC: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpViews()
    }
    
    func setUpViews() {}
}
