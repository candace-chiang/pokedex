//
//  SearchVC - UISetup.swift
//  pokedex
//
//  Created by Candace Chiang on 2/11/19.
//  Copyright © 2019 Candace Chiang. All rights reserved.
//

import UIKit

extension SearchViewController {
    func setUpBackground() {
        view.backgroundColor = UIColor(hexString: "#F8ECE0")
        headerView = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height/4))
        headerView.center = CGPoint(x: view.frame.width/2, y: view.frame.height * (1/9.5))
        headerView.image = UIImage(named: "logo")
        headerView.contentMode = .scaleAspectFit
        view.addSubview(headerView)
    }
    
    func setUpLabels() {
        let xOffset = view.frame.width/16
        let yOffset = view.frame.width/80
        let labelHeight = view.frame.height/12
        
        nameLabel = UILabel(frame: CGRect(x: xOffset, y: view.frame.height/6 + view.frame.width/55, width: view.frame.width/4, height: labelHeight))
        nameLabel.text = "Name: "
        nameLabel.font = UIFont(name: "Pokemon Classic", size: 13)
        view.addSubview(nameLabel)
        
        numberLabel = UILabel(frame: CGRect(x: xOffset, y: nameLabel.frame.maxY + yOffset, width: view.frame.width/4, height: labelHeight))
        numberLabel.text = "Number: "
        numberLabel.font = UIFont(name: "Pokemon Classic", size: 13)
        view.addSubview(numberLabel)
        
        typeLabel = UILabel(frame: CGRect(x: xOffset, y: numberLabel.frame.maxY + yOffset, width: view.frame.width/4, height: labelHeight))
        typeLabel.text = "Type: "
        typeLabel.font = UIFont(name: "Pokemon Classic", size: 13)
        view.addSubview(typeLabel)
        
        attackLabel = UILabel(frame: CGRect(x: xOffset, y: typeLabel.frame.maxY + yOffset, width: view.frame.width/2, height: labelHeight))
        attackLabel.text = "Minimum Attack: "
        attackLabel.font = UIFont(name: "Pokemon Classic", size: 13)
        view.addSubview(attackLabel)
        
        defenseLabel = UILabel(frame: CGRect(x: xOffset, y: attackLabel.frame.maxY + yOffset, width: view.frame.width/2, height: labelHeight))
        defenseLabel.text = "Minimum Defense: "
        defenseLabel.font = UIFont(name: "Pokemon Classic", size: 13)
        view.addSubview(defenseLabel)
        
        healthLabel = UILabel(frame: CGRect(x: xOffset, y: defenseLabel.frame.maxY + yOffset, width: view.frame.width/2, height: labelHeight))
        healthLabel.text = "Minimum Health: "
        healthLabel.font = UIFont(name: "Pokemon Classic", size: 13)
        view.addSubview(healthLabel)
    }
    
    func setUpImages() {
        ballView = UIImageView(frame: CGRect(x: view.frame.width/18, y: healthLabel.frame.maxY + view.frame.height/50, width: view.frame.width * 2/5, height: view.frame.height/9))
        ballView.image = UIImage(named: "pokeball")
        ballView.contentMode = .scaleAspectFit
        view.addSubview(ballView)
        
        greatView = UIImageView(frame: CGRect(x: view.frame.width/2, y: healthLabel.frame.maxY + view.frame.height/50, width: view.frame.width * 1/2, height: view.frame.height/9))
        greatView.image = UIImage(named: "greatball")
        greatView.contentMode = .scaleAspectFit
        view.addSubview(greatView)
    }
    
    func setUpFields() {
        let xOffset = view.frame.width/40
        let maxX = view.frame.width * 15/16
        let fieldHeight = view.frame.height/25
        
        nameInput = UITextField(frame: CGRect(x: nameLabel.frame.maxX + xOffset, y: nameLabel.frame.midY - fieldHeight/2, width: maxX - (nameLabel.frame.maxX + xOffset), height: fieldHeight))
        nameInput.font = UIFont(name: "Pokemon Classic", size: 13)
        nameInput.placeholder = "bobby jones"
        nameInput.borderStyle = .roundedRect
        nameInput.addTarget(self, action: #selector(nameInfo), for: .allEditingEvents)
        view.addSubview(nameInput)
        
        numberInput = UITextField(frame: CGRect(x: numberLabel.frame.maxX + xOffset, y: numberLabel.frame.midY - fieldHeight/2, width: maxX - (numberLabel.frame.maxX + xOffset), height: fieldHeight))
        numberInput.font = UIFont(name: "Pokemon Classic", size: 13)
        numberInput.placeholder = "420"
        numberInput.borderStyle = .roundedRect
        numberInput.keyboardType = UIKeyboardType.numberPad
        numberInput.addTarget(self, action: #selector(numberInfo), for: .allEditingEvents)
        view.addSubview(numberInput)
        
        pickType = UIPickerView()
        typeInput = UITextField(frame: CGRect(x: typeLabel.frame.maxX + xOffset, y: typeLabel.frame.midY - fieldHeight/2, width: maxX - (typeLabel.frame.maxX + xOffset), height: fieldHeight))
        typeInput.font = UIFont(name: "Pokemon Classic", size: 13)
        typeInput.placeholder = "click to select"
        typeInput.inputView = pickType
        typeInput.borderStyle = .roundedRect
        typeInput.addTarget(self, action: #selector(typeInfo), for: .allEditingEvents)
        view.addSubview(typeInput)

        attackInput = UITextField(frame: CGRect(x: attackLabel.frame.maxX + xOffset, y: attackLabel.frame.midY - fieldHeight/2, width: maxX - (attackLabel.frame.maxX + xOffset), height: fieldHeight))
        attackInput.font = UIFont(name: "Pokemon Classic", size: 13)
        attackInput.placeholder = "#gym"
        attackInput.borderStyle = .roundedRect
        attackInput.keyboardType = UIKeyboardType.numberPad
        attackInput.addTarget(self, action: #selector(attackInfo), for: .allEditingEvents)
        view.addSubview(attackInput)

        defenseInput = UITextField(frame: CGRect(x: defenseLabel.frame.maxX + xOffset, y: defenseLabel.frame.midY - fieldHeight/2, width: maxX - (defenseLabel.frame.maxX + xOffset), height: fieldHeight))
        defenseInput.font = UIFont(name: "Pokemon Classic", size: 13)
        defenseInput.placeholder = "#thicc"
        defenseInput.borderStyle = .roundedRect
        defenseInput.keyboardType = UIKeyboardType.numberPad
        defenseInput.addTarget(self, action: #selector(defenseInfo), for: .allEditingEvents)
        view.addSubview(defenseInput)

        healthInput = UITextField(frame: CGRect(x: healthLabel.frame.maxX + xOffset, y: healthLabel.frame.midY - fieldHeight/2, width: maxX - (healthLabel.frame.maxX + xOffset), height: fieldHeight))
        healthInput.font = UIFont(name: "Pokemon Classic", size: 13)
        healthInput.placeholder = "#boba"
        healthInput.borderStyle = .roundedRect
        healthInput.keyboardType = UIKeyboardType.numberPad
        healthInput.addTarget(self, action: #selector(healthInfo), for: .allEditingEvents)
        view.addSubview(healthInput)

    }
    
    func setUpButtons() {
        let xOffset = view.frame.width/7
        let yValue = view.frame.height * 42/50
        let buttonHeight = view.frame.height/20
        
        searchButton = UIButton(frame: CGRect(x: ballView.frame.midX - xOffset, y: yValue, width: 2 * xOffset, height: buttonHeight))
        searchButton.setTitle("Search", for: .normal)
        searchButton.setTitleColor(.black, for: .normal)
        searchButton.titleLabel!.font = UIFont(name: "Pokemon Classic", size: 13)
        searchButton.layer.borderWidth = 3
        searchButton.layer.borderColor = UIColor(hexString: "#F5D0A9").cgColor
        searchButton.layer.cornerRadius = 5.0
        searchButton.addTarget(self, action: #selector(filter), for: .touchUpInside)
        view.addSubview(searchButton)
        
        randomButton = UIButton(frame: CGRect(x: greatView.frame.midX - xOffset, y: yValue, width: 2 * xOffset, height: buttonHeight))
        randomButton.setTitle("Random", for: .normal)
        randomButton.setTitleColor(.black, for: .normal)
        randomButton.titleLabel!.font = UIFont(name: "Pokemon Classic", size: 13)
        randomButton.layer.borderWidth = 3
        randomButton.layer.borderColor = UIColor(hexString: "#F5D0A9").cgColor
        randomButton.layer.cornerRadius = 5.0
        randomButton.addTarget(self, action: #selector(random), for: .touchUpInside)
        view.addSubview(randomButton)
        
    }
}
