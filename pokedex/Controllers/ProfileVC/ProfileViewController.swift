//
//  ProfileViewController.swift
//  pokedex
//
//  Created by Candace Chiang on 2/14/19.
//  Copyright © 2019 Candace Chiang. All rights reserved.
//

import UIKit
import SafariServices

class ProfileViewController: UIViewController {
    
    var pokemon: Pokemon!
    
    var infoButton: UIButton!
    var favesButton: UIButton!
    
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
        self.navigationController!.isNavigationBarHidden = false

        setUpImages()
        setUpLabels()
        setUpButtons()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController!.isNavigationBarHidden = false
    }

    @objc func info(_ button: UIButton) {
        if let url = URL(string: "https://google.com/search?q=" + pokemon.name){
            let linkController = SFSafariViewController(url: url)
            self.present(linkController, animated: true)
        }
    }
    
}
