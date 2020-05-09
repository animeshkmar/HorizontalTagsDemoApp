//
//  TableVC.swift
//  HorizontalLayoutGym
//
//  Created by Animesh Kumar on 08/05/20.
//  Copyright © 2020 Animesh K. All rights reserved.
//

import UIKit

class TableVC: UIViewController {

    // Create an object for UITableView
    var tableView: UITableView = UITableView()
    
    // Create a String type optional which stores the selected tagName
    var selectedTagName: String?
    
    // Create a closure which sets selectedTagName and reloads tableView.
    // This closure is passed to the CollectionViewCell Class which handles Tag Button tap and sets the tagName accurately
    lazy var refreshTableVC = {(tagName: String) -> Void in
        self.selectedTagName = tagName
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Demo App"
        configTableView()
    }

    func configTableView() -> Void {
        
        // ADD SUBVIEW
        view.addSubview(tableView)
        
        // SET VIEW AS DELEGATE AND DATA SOURCE
        tableView.delegate      = self
        tableView.dataSource    = self
        
        
        // SET TABLE HEIGHT AS DYNAMIC
        tableView.estimatedRowHeight            = 80
        tableView.rowHeight                     = UITableView.automaticDimension
        tableView.sectionHeaderHeight           = 60
        
        // REGISTER PROTOTYPE CELL
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.register(TableHeader.self, forHeaderFooterViewReuseIdentifier: "Header")
        
        // SET TABLE CONSTRAINTS
        setTableViewConstraints()
    }
}



// MARK: CONFORM TO TABLE VIEW PROTOCOLS

extension TableVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "Header") as! TableHeader
        header.configCollectionView()
        header.refreshTableVCFunc = refreshTableVC
        return header
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        cell.configCell(tagName: selectedTagName ?? "UI/UX Design")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.reloadData()
    }
}



// MARK: SET CONSTRAINTS

extension TableVC {
    
    func setTableViewConstraints() -> Void {
        tableView.translatesAutoresizingMaskIntoConstraints                                         = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive               = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive     = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive         = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive       = true
    }
}
