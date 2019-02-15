//
//  ProfileViewController.swift
//  pokedex
//
//  Created by Candace Chiang on 2/14/19.
//  Copyright © 2019 Candace Chiang. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var pokemon: Pokemon!
    
    var pokemonView: UIImageView!
    var nameLabel: UILabel!
    var numberLabel: UILabel!
    var attackLabel: UILabel!
    var defenseLabel: UILabel!
    var healthLabel: UILabel!
    var specialAttackLabel: UILabel!
    var specialDefenseLabel: UILabel!
    var speciesLabel: UILabel!
    var speedLabel: UILabel!
    var totalLabel: UILabel!
    var typesLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpImages()
        setUpLabels()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController!.isNavigationBarHidden = false
    }

    
}
