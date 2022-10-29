//
//  PokemonResponse.swift
//  student584777
//
//  Created by user224582 on 10/26/22.
//

import Foundation

// MARK: - PokemonResponse
struct PokemonResponse: Codable {
    let id: Int
    let name: String
    let types: [TypeElement]
}

// MARK: - TypeElement
struct TypeElement: Codable, Identifiable {
    var id: String {
            self.type.name
        }
        let type: TypeType
}

// MARK: - TypeType
struct TypeType: Codable {
    let name: String
}


