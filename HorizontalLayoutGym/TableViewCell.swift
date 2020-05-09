//
//  TableViewCell.swift
//  HorizontalLayoutGym
//
//  Created by Animesh Kumar on 08/05/20.
//  Copyright © 2020 Animesh K. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    var label = UILabel()
    
    func configCell(tagName: String) -> Void {
        
        addSubview(label)
        
        label.text = tagName
        
        setLabelConstraints()
    }
    
    func setLabelConstraints() -> Void {
        label.translatesAutoresizingMaskIntoConstraints                                     = false
        label.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive               = true
        label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive        = true
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive       = true
        label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive    = true
    }

}
