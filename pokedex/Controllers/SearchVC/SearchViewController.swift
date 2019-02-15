//
//  SearchViewController.swift
//  pokedex
//
//  Created by Candace Chiang on 2/10/19.
//  Copyright © 2019 Candace Chiang. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITextFieldDelegate {
    
    var nameLabel: UILabel!
    var numberLabel: UILabel!
    var typeLabel: UILabel!
    var attackLabel: UILabel!
    var defenseLabel: UILabel!
    var healthLabel: UILabel!
    
    var nameInput: UITextField!
    var numberInput: UITextField!
    var typeInput: UITextField!
    var attackInput: UITextField!
    var defenseInput: UITextField!
    var healthInput: UITextField!
    
    var pickType: UIPickerView!
    let types = ["Bug", "Dark", "Dragon", "Electric", "Fairy", "Fighting", "Fire", "Flying", "Ghost", "Grass", "Ground", "Ice", "Normal", "Poison", "Psychic", "Rock", "Steel", "Water"]
    
    var headerView: UIImageView!
    var ballView: UIImageView!
    var greatView: UIImageView!
    
    var searchButton: UIButton!
    var randomButton: UIButton!
    
    var name = ""
    var number = -1
    var type = ""
    var attack = -1
    var defense = -1
    var health = -1
    
    var pokemonArray: [Pokemon]!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setUpBackground()
        setUpLabels()
        setUpImages()
        setUpFields()
        setUpButtons()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController!.isNavigationBarHidden = true
        self.nameInput.delegate = self
        self.numberInput.delegate = self
        self.pickType.delegate = self
        self.attackInput.delegate = self
        self.defenseInput.delegate = self
        self.healthInput.delegate = self
    }
    
    //dismiss keyboard when you press somewhere else
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    //dismiss keyboard when you press return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //after the user inputs text for the corresponding fields
    @objc func nameInfo (_ sender: UITextField) {
        let possName = sender.text
        if possName != "" {
            name = possName!
        }
    }
    
    @objc func numberInfo (_ sender: UITextField) {
        let possNumber = sender.text
        if possNumber != "" {
            number = Int(possNumber!)!
        }
    }
    
    @objc func typeInfo (_ sender: UITextField) {
        let possType = sender.text
        if possType != "" {
            type = possType!
        }
    }

    @objc func attackInfo (_ sender: UITextField) {
        let possAttack = sender.text
        if possAttack != "" {
            attack = Int(possAttack!)!
        }
    }
    
    @objc func defenseInfo (_ sender: UITextField) {
        let possDefense = sender.text
        if possDefense != "" {
            defense = Int(possDefense!)!
        }
    }
    
    @objc func healthInfo (_ sender: UITextField) {
        let possHealth = sender.text
        if possHealth != "" {
            health = Int(possHealth!)!
        }
    }
    
    @objc func filter (_ sender: UIButton) {
        pokemonArray = Functions.search(name: name.trimmingCharacters(in: .whitespaces), number: number, type: type, attack: attack, defense: defense, health: health)
        if pokemonArray.count == 1 {
            performSegue(withIdentifier: "single", sender: self)
        } else {
            performSegue(withIdentifier: "search", sender: self)
        }
    }
    
    @objc func random (_ sender: UIButton) {
        pokemonArray = Functions.random()
        performSegue(withIdentifier: "search", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            switch identifier {
                case "search":
                    let filterVC = segue.destination as! FilteredViewController
                    filterVC.pokemonArray = pokemonArray
                    break
                case "single":
                    let profileVC = segue.destination as! ProfileViewController
                    profileVC.pokemon = pokemonArray[0]
                    break
                default: break
            }
        }
    }

}

