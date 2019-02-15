//
//  CollectionViewCell.swift
//  pokedex
//
//  Created by Candace Chiang on 2/14/19.
//  Copyright © 2019 Candace Chiang. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    var pokemon: UIImageView!
    var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let size = contentView.frame.size
        pokemon = UIImageView(frame: CGRect(x: 0, y: 0, width: size.width * 2/3, height: size.height/2))
        pokemon.center = CGPoint(x: size.width/2, y: size.height/4)
        pokemon.contentMode = .scaleAspectFit
        contentView.addSubview(pokemon)
        
        label = UILabel(frame: CGRect(x: 0, y: size.height * 2/5, width: size.width, height: size.height/2))
        label.font = UIFont(name: "Pokemon Classic", size: 10)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        contentView.addSubview(label)
    }
    
}
