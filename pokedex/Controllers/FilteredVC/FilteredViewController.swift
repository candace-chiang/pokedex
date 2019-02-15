//
//  FilteredViewController.swift
//  pokedex
//
//  Created by Candace Chiang on 2/14/19.
//  Copyright © 2019 Candace Chiang. All rights reserved.
//

import UIKit

class FilteredViewController: UIViewController {
    
    var pokemonArray: [Pokemon]!
    
    var pokemonTable: UITableView!
    var pokemonGrid: UICollectionView!
    
    var toggleButton: UISegmentedControl!
    
    var selected: Pokemon!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTable()
        setUpGrid()
        setUpToggle()
        
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController!.isNavigationBarHidden = false
    }
    
    @objc func toggle(_ segmentedControl: UISegmentedControl) {
        switch (segmentedControl.selectedSegmentIndex) {
            case 0:
                pokemonTable.isHidden = false
                pokemonGrid.isHidden = true
                break
            case 1:
                pokemonTable.isHidden = true
                pokemonGrid.isHidden = false
                break
            default:
                break
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            switch identifier {
            case "select":
                let profileVC = segue.destination as! ProfileViewController
                profileVC.pokemon = selected
                break
            default: break
            }
        }
    }

}
