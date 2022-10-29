//
//  PokedexApp.swift
//  Pokedex
//
//  Created by Kevin van den Hoek on 13/10/2022.
//

import SwiftUI

@main
struct PokedexApp: App {
    
    @StateObject var pokemonStore = PokemonStore()
    @StateObject var favourites: Favourites = .init()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(pokemonStore)
                .environmentObject(favourites)
        }
    }
}
