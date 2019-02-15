//
//  FilteredVC - Delegate.swift
//  pokedex
//
//  Created by Candace Chiang on 2/14/19.
//  Copyright © 2019 Candace Chiang. All rights reserved.
//

import UIKit

extension FilteredViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height/13
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
            as! TableViewCell
        for subView in cell.contentView.subviews {
            subView.removeFromSuperview()
        }
        cell.awakeFromNib()
        let size = CGSize(width: tableView.frame.width, height: view.frame.height/13)
        cell.initCellFrom(size: size)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let tableCell = cell as! TableViewCell
        let pokemon = pokemonArray[indexPath.row]
        let name = Functions.clipName(name: pokemon.name!)
        tableCell.label.text = "#\(pokemon.number!) " + name
        tableCell.pokemon.image = Functions.picFromURL(pokemon.imageUrl)

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selected = pokemonArray[indexPath.row]
        performSegue(withIdentifier: "select", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
