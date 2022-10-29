//
//  FavouritesView.swift
//  student584777
//
//  Created by user224582 on 10/29/22.
//

import SwiftUI

struct FavouritesView: View {
    
    @EnvironmentObject var favourites: Favourites
    
    var body: some View {
        NavigationView() {
            if (favourites.favouritePokemon != []) {
                
                ForEach(favourites.favouritePokemon, id: \.id) { pokemon in
                    PokemonCell(pokemon: pokemon)
                }
                
            } else {
                VStack {
                    Text("You have no favourites yet")
                }
                
            }
            
        }
    }
}

struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesView()
    }
}
