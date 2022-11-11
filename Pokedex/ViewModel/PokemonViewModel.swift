//
//  PokemonViewModel.swift
//  Pokedex
//
//  Created by Rutvi Shah on 11/9/22.
//

import SwiftUI

class PokemonViewModel: ObservableObject{
    @Published var pokemonImage = [PokemonImage]()
    
    init(offset: Int){
        fetchPokemonURL(offset: offset)
    }
    
    func fetchPokemonURL(offset: Int){
        let baseURL = "https://pokeapi.co/api/v2/pokemon?limit=20&offset=\(offset)"
        guard let url = URL(string: baseURL) else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            do {
                let resultsList = try JSONDecoder().decode(PokemonList.self, from: data)
                DispatchQueue.main.async{
                    self.fetchPokemonImage(pokemonURL: resultsList.results)
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
    
    func fetchPokemonImage(pokemonURL: [PokemonURL]){
        for pokemon in pokemonURL{
            guard let url = URL(string: pokemon.url) else {return}
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data else { return }
                do {
                    let pokemon = try JSONDecoder().decode(PokemonImage.self, from: data)
                    DispatchQueue.main.async{
                        self.pokemonImage.append(pokemon)
                    }
                } catch let error {
                    print(error)
                }
            }.resume()
        }
    }
}
