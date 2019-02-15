//
//  FavoritesViewController.swift
//  pokedex
//
//  Created by Candace Chiang on 2/13/19.
//  Copyright © 2019 Candace Chiang. All rights reserved.
//

//same as FilteredVC Table stuff (:::

import UIKit

class FavoritesViewController: UIViewController {
    /*
    var favesTable: UITableView!
    
    var selected: Pokemon!
    
    let defaults = UserDefaults.standard
    var pokemonArray = defaults.object(forKey: "favorites")
*/
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setUpTable()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController!.isNavigationBarHidden = false
    }

}
