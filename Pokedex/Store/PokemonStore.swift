//
//  PokemonStore.swift
//  Pokedex
//
//  Created by Kevin van den Hoek on 13/10/2022.
//

import Foundation

class PokemonStore: ObservableObject {
    
    @Published var pokemons: [SimplePokemon] = []
    @Published var pokemon: Pokemon?
    
    private let pokeAPI: PokeAPI = PokeAPI()
    
    func loadData() {
        pokeAPI.fetchAllPokemons(completion: { result in
            switch result {
            case .success(let pokemons):
                self.pokemons = pokemons
            case .failure(let error):
                print("error: \(error)")
            }
        })
    }
    
    func loadDetails(id: Int) {
        pokeAPI.fetchPokemon(id: id, completion: { result in
            switch result {
            case .success(let pokemon):
                self.pokemon = pokemon
            case .failure(let error):
                print("error: \(error)")
            }
        })
    }
}
