//
//  PokemonModel.swift
//  API Product
//
//  Created by Daxton Dollar on 11/12/19.
//  Copyright © 2019 Daxton Dollar. All rights reserved.
//

import Foundation

struct PokemonList: Codable {
    let count: Int
    let results: [PokemonListItem]
}

struct PokemonListItem: Codable {
    let name: String
    let url: URL
}
