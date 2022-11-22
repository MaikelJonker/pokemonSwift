//
//  PokedexView.swift
//  student584777
//
//  Created by user224582 on 11/22/22.
//

import SwiftUI

struct PokedexView: View {
    
    @EnvironmentObject var pokemonStore: PokemonStore
    var body: some View {
        
        NavigationView(){
            if(!pokemonStore.pokemons.isEmpty){
                List(pokemonStore.pokemons) { pokemon in
                    PokemonCell(pokemon: pokemon)
                }
                .toolbar{
                    ToolbarItem(placement: .principal) {
                        Text("Pokedex")
                    }
                }
            }
            else{
                Text("Could not load Pokedex")
            }
        }
        .onAppear(perform: handleOnAppear)
    }
}

// MARK: Action handlers
private extension PokedexView {
    
    func handleOnAppear() {
        pokemonStore.loadData()
    }
}

struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}
