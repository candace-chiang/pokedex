//
//  TableViewCell.swift
//  pokedex
//
//  Created by Candace Chiang on 2/14/19.
//  Copyright © 2019 Candace Chiang. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    var pokemon: UIImageView!
    var label: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    func initCellFrom(size: CGSize) {
        pokemon = UIImageView(frame: CGRect(x: size.width/10, y: size.height/5, width: size.width/10, height: size.height * 2/3))
        pokemon.contentMode = .scaleAspectFit
        contentView.addSubview(pokemon)
        
        label = UILabel(frame: CGRect(x: pokemon.frame.maxX + size.width/16, y: size.height/6, width: size.width * 4/6, height: size.height * 2/3))
        label.font = UIFont(name: "Pokemon Classic", size: 12)
        label.adjustsFontSizeToFitWidth = true
        contentView.addSubview(label)
    }
}
