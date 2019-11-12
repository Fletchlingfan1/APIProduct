//
//  PokemonListController.swift
//  API Product
//
//  Created by Daxton Dollar on 11/12/19.
//  Copyright © 2019 Daxton Dollar. All rights reserved.
//

import Foundation

enum PokemonListError: Error {
    case failed
}
protocol PokemonListController {
    func getPokemonList(compleation: @escaping (Result<PokemonList,PokemonListError>) -> Void)
}
