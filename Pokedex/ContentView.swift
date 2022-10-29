//
//  ContentView.swift
//  Pokedex
//
//  Created by Kevin van den Hoek on 13/10/2022.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @EnvironmentObject var pokemonStore: PokemonStore
    
    var body: some View {
        TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
            NavigationView(){
                List(pokemonStore.pokemons) { pokemon in
                    PokemonCell(pokemon: pokemon)
                }
            }
            .onAppear(perform: handleOnAppear)
            .tabItem {
                Image(systemName: "circle.fill"); Text("Pokedex")
            }.tag(1)
            
            FavouritesView().tabItem {Image(systemName: "heart.fill"); Text("Favourites") }.tag(2)
        }
    }
}

// MARK: Action handlers
private extension ContentView {
    
    func handleOnAppear() {
        pokemonStore.loadData()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
