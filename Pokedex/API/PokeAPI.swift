//
//  PokeAPI.swift
//  Pokedex
//
//  Created by Kevin van den Hoek on 13/10/2022.
//

import Foundation
import Combine


class PokeAPI {
    
    // MARK: Properties
    private var cancellables: [AnyCancellable] = []
    
    // MARK: Methods
    func fetchAllPokemons(completion: @escaping (Result<[SimplePokemon], Error>) -> Void) {
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon")!
        fetch(type: AllPokemonsResponse.self, url: url, completion: { result in
            switch result {
            case .success(let response):
                let pokemons = response.results
                    .enumerated()
                    .map({ (i, entity) in
                        return SimplePokemon(id: i + 1, name: entity.name)
                    })
                completion(.success(pokemons))
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
    
    func fetchPokemon(id: Int, completion: @escaping (Result<Pokemon, Error>) -> Void) {
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(id)")!
        fetch(type: PokemonResponse.self, url: url, completion: { result in
            switch result {
            case .success(let response):
                let pokemon = Pokemon(id: response.id, name: response.name, types: response.types)
                completion(.success(pokemon))
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
}


// MARK: Helpers
private extension PokeAPI {
    
    func fetch<T: Decodable>(type: T.Type, url: URL, completion: @escaping (Result<T, Error>) -> Void) {
        URLSession.shared.dataTaskPublisher(for: url)
            .map({ $0.data })
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { result in
                    switch result {
                    case .finished:
                        break
                    case .failure(let error):
                        completion(.failure(error))
                    }
                },
                receiveValue: { response in
                    completion(.success(response))
                }
            )
            .store(in: &cancellables)
    }
}
