//
//  PokemonCell.swift
//  Pokedex
//
//  Created by Kevin van den Hoek on 13/10/2022.
//

import SwiftUI

struct PokemonCell: View {
    
    let pokemon: SimplePokemon
    
    var body: some View {
        
        LazyHStack {
            NavigationLink(destination: PokemonDetailView(simplePokemon: pokemon)){
                AsyncImage(
                    url: pokemon.imageUrl,
                    content: { image in
                        image
                            .resizable()
                    },
                    placeholder: {
                        ProgressView()
                    }
                )
                .frame(width: 50, height: 50)
                Text(pokemon.name)
            }
        }
    }
}

struct PokemonCell_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCell(pokemon: SimplePokemon(id: 1, name: "bulbasaur"))
    }
}
