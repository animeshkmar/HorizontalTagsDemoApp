//
//  CollectionViewCell.swift
//  HorizontalLayoutGym
//
//  Created by Animesh Kumar on 08/05/20.
//  Copyright © 2020 Animesh K. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    var button: UIButton    = UIButton()
    var tagName: String?
    
    // Variable that receives the Table Refresh Closure from TableVC -> TableHeader
    var refreshTableVCFunc = {(tagName: String) -> Void in }
    
    
    func configButton(buttonText: String) -> Void {
        
        addSubview(button)
        
        tagName = buttonText
        
        button.setTitle(buttonText, for: .normal)
        
        button.backgroundColor      = .systemBlue
        button.contentEdgeInsets    = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        button.layer.cornerRadius   = 18
        button.clipsToBounds        = true
        button.titleLabel?.font     = .systemFont(ofSize: 14)
        
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        setButtonConstraintes()
    }
    
    func setButtonConstraintes() {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40).isActive = true
        button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 30).isActive = true
    }
    
    @objc func buttonTapped() {
        if let tagName = tagName {
            
            // The closure set out in Table VC in action
            refreshTableVCFunc(tagName)
        }
    }
}

