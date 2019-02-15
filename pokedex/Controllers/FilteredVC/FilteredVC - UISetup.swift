//
//  FilteredVC - UISetup.swift
//  pokedex
//
//  Created by Candace Chiang on 2/14/19.
//  Copyright © 2019 Candace Chiang. All rights reserved.
//

import UIKit

extension FilteredViewController {
    func setUpBackground() {
        view.backgroundColor = UIColor(hexString: "#F8ECE0")
    }
    
    func setUpTable() {
        pokemonTable = UITableView(frame: view.frame)
        pokemonTable.register(TableViewCell.self, forCellReuseIdentifier: "tableCell")
        pokemonTable.delegate = self
        pokemonTable.dataSource = self
        pokemonTable.separatorStyle = UITableViewCellSeparatorStyle.none
        pokemonTable.rowHeight = view.frame.height/13
        pokemonTable.contentInset = UIEdgeInsetsMake(view.frame.height/30, 0, self.tabBarController!.tabBar.frame.height - view.frame.height/50, 0)
        view.addSubview(pokemonTable)
    }
    
    func setUpGrid() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 1
        layout.itemSize = CGSize(width: view.frame.width/4, height: view.frame.height/4)
        pokemonGrid = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        pokemonGrid.register(CollectionViewCell.self, forCellWithReuseIdentifier: "gridCell")
        pokemonGrid.delegate = self
        pokemonGrid.dataSource = self
        pokemonGrid.backgroundColor = .white
        pokemonGrid.contentInset = UIEdgeInsetsMake(view.frame.height/20, view.frame.width/10, view.frame.height/20, view.frame.width/10)
        view.addSubview(pokemonGrid)
    }
    
    func setUpToggle() {
        let items = ["List", "Grid"]
        toggleButton = UISegmentedControl(items: items)
        toggleButton.addTarget(self, action: #selector(toggle), for: .valueChanged)
        toggleButton.selectedSegmentIndex = 0
        self.navigationItem.titleView = toggleButton
        
        pokemonTable.isHidden = false
        pokemonGrid.isHidden = true

    }
    
}
