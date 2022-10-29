//
//  Favourites.swift
//  student584777
//
//  Created by user224582 on 10/26/22.
//

import Foundation
import SwiftUI

class Favourites: ObservableObject {
    
    @Published var favouritePokemon: [SimplePokemon] = []
        
        func toggleFavorite(_ pokemon: SimplePokemon) {
            if isFavorite(pokemon) {
                favouritePokemon = favouritePokemon.filter({ $0.id != pokemon.id })
            } else {
                favouritePokemon.append(pokemon)
            }
        }
        
        func isFavorite(_ pokemon: SimplePokemon) -> Bool {
            return favouritePokemon.contains(where: {$0.id == pokemon.id})
        }
}
