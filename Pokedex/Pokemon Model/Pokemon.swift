//
//  Pokemon.swift
//  Pokedex
//
//  Created by Rutvi Shah on 11/9/22.
//

import Foundation

struct PokemonList: Codable {
    let results: [PokemonURL]
}

struct PokemonURL : Codable{
    let url: String
}

struct PokemonImage : Codable, Identifiable{
    let name: String
    let sprites: PokemonImageURL
    var id: String {
        self.name
    }
}

struct PokemonImageURL : Codable{
    let front_default: String
}
