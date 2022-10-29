//
//  AllPokemonsResponse.swift
//  Pokedex
//
//  Created by Kevin van den Hoek on 13/10/2022.
//

import Foundation

struct AllPokemonsResponse: Decodable {
    
    let results: [PokemonEntity]
}

struct PokemonEntity: Decodable {
    
    let name: String
}
