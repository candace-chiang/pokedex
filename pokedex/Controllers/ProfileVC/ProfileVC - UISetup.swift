//
//  ProfileVC - UISetup.swift
//  pokedex
//
//  Created by Candace Chiang on 2/14/19.
//  Copyright © 2019 Candace Chiang. All rights reserved.
//

/*
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
 
 let name: String!
 let number: Int!
 let attack: Int!
 let defense: Int!
 let health: Int!
 let specialAttack: Int!
 let specialDefense: Int!
 let species: String!
 let speed: Int!
 let total: Int!
 let types: [String]
 let imageUrl: String!
 let stats: [Int]!
 */

import UIKit

extension ProfileViewController {
    func setUpImages() {
        pokemonView = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width * 7/10, height: view.frame.height * 2/5))
        pokemonView.center = CGPoint(x: view.frame.width/2, y: view.frame.height * 7/20)
        pokemonView.image = Functions.picFromURL(pokemon.imageUrl)
        pokemonView.contentMode = .scaleAspectFit
        view.addSubview(pokemonView)
        
    }
    
    func setUpLabels() {
        
        speciesLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width * 3/4, height: view.frame.height/25))
        speciesLabel.center = CGPoint(x: view.frame.width/2, y: (self.navigationController!.navigationBar.frame.maxY + pokemonView.frame.minY)/2)
        var species = pokemon.species
        if species == "" {
            species = "???"
        }
        speciesLabel.text = "Species:  " + species!
        speciesLabel.font = UIFont(name: "Pokemon Classic", size: 13)
        speciesLabel.textAlignment = .center
        speciesLabel.adjustsFontSizeToFitWidth = true
        view.addSubview(speciesLabel)
        
        numberLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width * 4/5, height: view.frame.height/15))
        numberLabel.center = CGPoint(x: view.frame.width/2, y: pokemonView.frame.maxY + view.frame.height/20)
        numberLabel.text = "#\(pokemon.number!)"
        numberLabel.font = UIFont(name: "Pokemon Classic", size: 16)
        numberLabel.textAlignment = .center
        view.addSubview(numberLabel)
        
        nameLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width * 4/5, height: view.frame.height/10))
        nameLabel.center = CGPoint(x: view.frame.width/2, y: numberLabel.frame.maxY + view.frame.height/80)
        nameLabel.text = pokemon.name
        nameLabel.font = UIFont(name: "Pokemon Classic", size: 18)
        nameLabel.textAlignment = .center
        nameLabel.adjustsFontSizeToFitWidth = true
        view.addSubview(nameLabel)
        
        totalLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width * 2/5, height: view.frame.height/20))
        totalLabel.center = CGPoint(x: view.frame.width/2, y: nameLabel.frame.maxY + view.frame.height/80)
        totalLabel.layer.masksToBounds = true
        totalLabel.backgroundColor = UIColor(hexString: "#D8D8D8")
        totalLabel.text = "Total:  \(pokemon.total!)"
        totalLabel.font = UIFont(name: "Pokemon Classic", size: 16)
        totalLabel.textAlignment = .center
        totalLabel.layer.cornerRadius = 10
        totalLabel.adjustsFontSizeToFitWidth = true
        view.addSubview(totalLabel)
        
        typesLabel = UILabel(frame: CGRect(x: view.frame.width/8, y: totalLabel.frame.maxY + view.frame.height/60, width: view.frame.width * 3/4, height: view.frame.height/25))
        typesLabel.text = "Types:  " + pokemon.types.joined(separator: ",  ")
        typesLabel.font = UIFont(name: "Pokemon Classic", size: 13)
        typesLabel.textAlignment = .center
        typesLabel.adjustsFontSizeToFitWidth = true
        view.addSubview(typesLabel)
        
        let statsWidth = view.frame.width * 0.27
        let statsHeight = view.frame.height/27
        let xOffset = view.frame.width/40
        let yOffset = view.frame.height/100
        
        attackLabel = UILabel(frame: CGRect(x: view.frame.width * 0.07, y: typesLabel.frame.maxY + view.frame.height/60, width: statsWidth, height: statsHeight))
        attackLabel.backgroundColor = UIColor(hexString: "#F5A9A9")
        attackLabel.text = "Attack:  \(pokemon.attack!)"
        statsLabel(attackLabel)
        view.addSubview(attackLabel)
        
        defenseLabel = UILabel(frame: CGRect(x: attackLabel.frame.maxX + xOffset, y: typesLabel.frame.maxY + view.frame.height/60, width: statsWidth, height: statsHeight))
        defenseLabel.backgroundColor = UIColor(hexString: "#F5D0A9")
        defenseLabel.text = "Defense:  \(pokemon.defense!)"
        statsLabel(defenseLabel)
        view.addSubview(defenseLabel)
        
        healthLabel = UILabel(frame: CGRect(x: defenseLabel.frame.maxX + xOffset, y: typesLabel.frame.maxY + view.frame.height/60, width: statsWidth, height: statsHeight))
        healthLabel.backgroundColor = UIColor(hexString: "#F2F5A9")
        healthLabel.text = "Health:  \(pokemon.health!)"
        statsLabel(healthLabel)
        view.addSubview(healthLabel)
        
        specialAttackLabel = UILabel(frame: CGRect(x: attackLabel.frame.minX, y: attackLabel.frame.maxY + yOffset, width: statsWidth, height: statsHeight))
        specialAttackLabel.backgroundColor = UIColor(hexString: "#BCF5A9")
        specialAttackLabel.text = "SpAtt:  \(pokemon.specialAttack!)"
        statsLabel(specialAttackLabel)
        view.addSubview(specialAttackLabel)
        
        specialDefenseLabel = UILabel(frame: CGRect(x: specialAttackLabel.frame.maxX + xOffset, y: attackLabel.frame.maxY + yOffset, width: statsWidth, height: statsHeight))
        specialDefenseLabel.backgroundColor = UIColor(hexString: "#A9D0F5")
        specialDefenseLabel.text = "SpDef:  \(pokemon.specialDefense!)"
        statsLabel(specialDefenseLabel)
        view.addSubview(specialDefenseLabel)
        
        speedLabel = UILabel(frame: CGRect(x: specialDefenseLabel.frame.maxX + xOffset, y: attackLabel.frame.maxY + yOffset, width: statsWidth, height: statsHeight))
        speedLabel.backgroundColor = UIColor(hexString: "#D0A9F5")
        speedLabel.text = "Speed:  \(pokemon.speed!)"
        statsLabel(speedLabel)
        view.addSubview(speedLabel)
        
    }
    
    func statsLabel(_ label: UILabel) {
        label.layer.masksToBounds = true
        label.font = UIFont(name: "Pokemon Classic", size: 10)
        label.textAlignment = .center
        label.layer.cornerRadius = 5
        label.adjustsFontSizeToFitWidth = true
    }
    
    func setUpButtons() {
        infoButton = UIButton(type: .infoLight)
        infoButton.addTarget(self, action: #selector(info), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: infoButton)
        
        /*
        favesButton = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.width/2, height: self.navigationController!.navigationBar.frame.height))
        if defaults.contains(key: pokemon.name!) {
            favesButton.setTitle("Unfavorite", for: .normal)
            favesButton.addTarget(self, action: #selector(unfavorite), for: .touchUpInside)
        } else {
            favesButton.setTitle("Favorite", for: .normal)
            favesButton.addTarget(self, action: #selector(favorite), for: .touchUpInside)
        }
        self.navigationItem.titleView = UIBarButtonItem(customView: favesButton)
 */
    }
    
}
