//
//  FilteredVC - Collection.swift
//  pokedex
//
//  Created by Candace Chiang on 2/14/19.
//  Copyright © 2019 Candace Chiang. All rights reserved.
//

import UIKit

extension FilteredViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemonArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "gridCell", for: indexPath)
            as! CollectionViewCell
        for subView in cell.contentView.subviews {
            subView.removeFromSuperview()
        }
        cell.awakeFromNib()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width/5, height: view.frame.height/5)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let gridCell = cell as! CollectionViewCell
        let pokemon = pokemonArray[indexPath.item]
        let name = Functions.clipName(name: pokemon.name!)
        gridCell.label.text = "#\(pokemon.number!)\n" + name
        gridCell.pokemon.image = Functions.picFromURL(pokemon.imageUrl)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selected = pokemonArray[indexPath.item]
        performSegue(withIdentifier: "select", sender: self)
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
}
