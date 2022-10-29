//
//  Pokemon.swift
//  Pokedex
//
//  Created by Kevin van den Hoek on 13/10/2022.
//

import Foundation

struct Pokemon: Codable, Equatable, Identifiable {
    
    let id: Int
    let name: String
    let types: [TypeElement]
    
    var imageUrl: URL {
        return URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id).png")!
    }
}

func ==(lhs: Pokemon, rhs: Pokemon) -> Bool {
    let areEqual = lhs.id == rhs.id &&
        lhs.name == rhs.name

    return areEqual
}
