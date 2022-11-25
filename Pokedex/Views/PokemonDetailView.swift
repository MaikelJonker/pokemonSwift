//
//  PokemonDetailView.swift
//  student584777
//
//  Created by user224582 on 10/26/22.
//

import SwiftUI

struct PokemonDetailView: View {
    
    let simplePokemon: SimplePokemon
    @State private var isLoading = true
    @EnvironmentObject var pokemonStore: PokemonStore
    @EnvironmentObject var favourites: Favourites
    var pokemon: Pokemon {
        return pokemonStore.pokemon ?? Pokemon(id: 0, name: "Default", types: [])
    }
    
    var body: some View {
        VStack{
            if(isLoading){
                ProgressView()
            } else {
                ScrollView{
                    Text("# \(pokemon.id)     \(pokemon.name)").font(.title)
                    AsyncImage(
                        url: simplePokemon.imageUrl,
                        content: { image in
                            image
                                .resizable()
                        },
                        placeholder: {
                            ProgressView()
                        }
                    )
                    .animation(.interpolatingSpring(stiffness: 1, damping: 1).speed(3))
                    .frame(width: 300, height: 300)
                    .onAppear{
                        pokemonStore.loadDetails(id: simplePokemon.id)
                    }
                    
                    VStack{
                        ForEach(pokemon.types) {type in
                            Text(type.type.name)
                                .padding(10)
                                .background(Color.blue.cornerRadius(20))
                                .padding(5)
                                .foregroundColor(.white)
                        }
                    }
                    .toolbar() {
                        ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing) {
                            HStack {
                                Button(
                                    action: {
                                        favourites.toggleFavorite(simplePokemon)
                                    },
                                    label: {
                                        let isFavorite = favourites.isFavorite(simplePokemon)
                                        Image(systemName: isFavorite ? "heart.fill" : "heart")
                                    }
                                )
                            }
                        }
                    }
                }
            }
        }
            .onAppear(perform: handleOnAppear)
    }
}

private extension PokemonDetailView {
    
    func handleOnAppear() {
        pokemonStore.loadDetails(id: pokemon.id)
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.isLoading = false
        }
    }
}
struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(simplePokemon: SimplePokemon(id: 1, name: "bulbasaur"))
            .environmentObject(PokemonStore())
    }
}
