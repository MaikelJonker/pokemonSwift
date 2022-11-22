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
                List(favourites.favouritePokemon, id: \.id) { pokemon in
                    PokemonCell(pokemon: pokemon)
                }.toolbar{
                    ToolbarItem(placement: .principal) {
                        Text("Favourites")
                    }
                }
            } else {
                Text("You have no favourites yet")
                    .toolbar{
                    ToolbarItem(placement: .principal) {
                        Text("Favourites")
                    }
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
