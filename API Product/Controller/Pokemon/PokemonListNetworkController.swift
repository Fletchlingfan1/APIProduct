//
//  PokemonListNetworkController.swift
//  API Product
//
//  Created by Daxton Dollar on 11/12/19.
//  Copyright © 2019 Daxton Dollar. All rights reserved.
//

import Foundation

class PokemonListNetworkController: PokemonListController {
    let baseURL = URL(string: "https://pokeapi.co/api/v2/")!
    let session = URLSession.shared
    let path = "pokemon"
    
    func getPokemonList(compleation: @escaping (Result<PokemonList, PokemonListError>) -> Void) {
        let pokemonListURL = baseURL.appendingPathComponent(path)
        
        let request = URLRequest(url: pokemonListURL)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            guard error == nil else { return compleation(.failure(.failed)) }
            
            if (response as? HTTPURLResponse)?.statusCode == 200, let data = data {
                let decoder = JSONDecoder ()
                
                do{
                    let pokemonList = try decoder.decode(PokemonList.self, from: data)
                    
                    compleation(.success(pokemonList))
                } catch {
                    print(error)
                    compleation(.failure(.failed))
                }
            } else {
                compleation(.failure(.failed))
            }
        }
        
        task.resume()
    }
}
