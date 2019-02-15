//
//  contains.swift
//  pokedex
//
//  Created by Candace Chiang on 2/14/19.
//  Copyright © 2019 Candace Chiang. All rights reserved.
//

import Foundation

extension UserDefaults {
    func contains(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) != nil
    }
}
