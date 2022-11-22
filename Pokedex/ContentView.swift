//
//  ContentView.swift
//  Pokedex
//
//  Created by Kevin van den Hoek on 13/10/2022.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @State var selection: Selection = .pokedex
    
    var body: some View {
        TabView(selection: $selection) {
            
            PokedexView().tabItem {Image(systemName: "circle.fill"); Text("Pokedex")
            }.tag(Selection.pokedex)
            
            FavouritesView().tabItem {Image(systemName: "heart.fill"); Text("Favourites")
            }.tag(Selection.favourites)                
        }
    }
}

enum Selection{
    case pokedex, favourites
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
