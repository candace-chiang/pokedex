//
//  Functions.swift
//  pokedex
//
//  Created by Candace Chiang on 2/14/19.
//  Copyright © 2019 Candace Chiang. All rights reserved.
//

import UIKit

class Functions {
    static func search(name: String, number: Int, type: String, attack: Int, defense: Int, health: Int) -> [Pokemon] {
        
        let allPokemon = PokemonGenerator.getPokemonArray()
        var pokemonArray: [Pokemon] = []
        var findName = false
        var findNumber = false
        
        if name != "" {
            findName = true
        }
        if number != -1 {
            findNumber = true
        }
        
        //don't want cases to matter when matching names
        for pokemon in allPokemon {
            if findName && findNumber {
                if pokemon.name.lowercased() == name.lowercased() && pokemon.number == number {
                    pokemonArray.append(pokemon)
                    break
                }
            } else if findName {
                if pokemon.name.lowercased() == name.lowercased() {
                    pokemonArray.append(pokemon)
                    break
                }
            } else if findNumber {
                if pokemon.number == number {
                    pokemonArray.append(pokemon)
                    break
                }
            } else {
                if (type == "" || pokemon.types.contains(type)) && pokemon.attack >= attack && pokemon.defense >= defense && pokemon.health >= health {
                    pokemonArray.append(pokemon)
                }
            }
        }
        return pokemonArray
    }
    
    static func random() -> [Pokemon] {
        let allPokemon = PokemonGenerator.getPokemonArray()
        let length = allPokemon.count
        var pokemonArray: [Pokemon] = []
        var indicesArray: [Int] = []
        var poss: Int
        
        while pokemonArray.count < 20 {
            poss = Int(arc4random_uniform(UInt32(length)))
            if !(indicesArray.contains(poss)) {
                indicesArray.append(poss)
                pokemonArray.append(allPokemon[poss])
            }
        }
        return pokemonArray
    }
    
    static func clipName(name: String) -> String {
        var clipped = name
        if name.contains("(") {
            let substring = String(name[name.index(of: "(")!...])
            var words = substring.split(separator: " ")
            clipped = name[...name.index(of: "(")!] + String(words[1]) + ")"
        }
        return clipped
    }
    
    static func picFromURL(_ urlString: String) -> UIImage {
        guard let url = URL(string: urlString) else {
            return UIImage(named: "pikachu")!
        }
        do {
            let data = try Data(contentsOf: url)
            return UIImage(data: data)!
        } catch {
            return UIImage(named: "pikachu")!
        }
    }
}
