//
//  TableHeader.swift
//  HorizontalLayoutGym
//
//  Created by Animesh Kumar on 08/05/20.
//  Copyright © 2020 Animesh K. All rights reserved.
//

import UIKit

class TableHeader: UITableViewHeaderFooterView {

    var layout              = UICollectionViewFlowLayout()
    lazy var collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
    
    // DUMMY TAGS ARRAY
    var tagsData: [String] = ["UI/UX Design", "Photoshop", "HTML", "CSS", "React", "Swift"]
    
    // Variable that receives the table refresh closure from TableVC
    var refreshTableVCFunc = {(tagName: String) -> Void in}
    
    func configCollectionView() -> Void {
        
        // ADD SUBVIEW
        addSubview(collectionView)
        
        // SET LAYOUT PROPERTIES
        layout.scrollDirection      = .horizontal
        layout.estimatedItemSize    = CGSize(width: 60, height: 60)
        layout.sectionInset         = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 40)
        
        // SET COLLECTIONVIEW PROPERTIES
        collectionView.showsHorizontalScrollIndicator   = false
        collectionView.backgroundColor                  = .systemYellow
        
        // SET COLLECTIONVIEW DELEGATE AND DATASOURCE
        collectionView.delegate     = self
        collectionView.dataSource   = self
        
        // REGISTER COLLECTIONVIEW CELLS
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        
        // SET COLLECTIONVIEW CONSTRAINTS
        setCollectionViewConstraints()
    }
}



// MARK: CONFORM TO COLLECTION VIEW PROTOCOLS

extension TableHeader: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tagsData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        let cellData = tagsData[indexPath.row]
        cell.configButton(buttonText: cellData)
        cell.refreshTableVCFunc = refreshTableVCFunc
        return cell
    }
}



// MARK: SET CONSTRAINTS

extension TableHeader {
    
    func setCollectionViewConstraints() -> Void {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        collectionView.heightAnchor.constraint(greaterThanOrEqualToConstant: 60).isActive = true
    }
}
