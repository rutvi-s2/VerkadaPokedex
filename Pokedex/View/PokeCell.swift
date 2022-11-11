//
//  PokeCell.swift
//  Pokedex
//
//  Created by Rutvi Shah on 11/9/22.
//

import SwiftUI
import Kingfisher

struct PokeCell: View {
    let pokemonImage : PokemonImage
    var body: some View {
        ZStack{
            VStack(alignment: .center){
                Text(pokemonImage.name)
                    .font(.headline)
                    .padding(.top, 8)
                    .padding(.leading, 8)
                    .padding(.trailing, 8)
                KFImage(URL(string: (pokemonImage.sprites).front_default))
                    .resizable()
                    .scaledToFit()
                    .frame(width:100, height:100)
                    .padding(.bottom, 8)
            }
        }
        .background(Color.purple)
        .cornerRadius(10)
        .shadow(color: .purple, radius:6)
    }
}

struct PokeCell_Previews: PreviewProvider {
    static var previews: some View {
        PokeCell(pokemonImage: (PokemonImage(name: "nameholder", sprites: PokemonImageURL(front_default: "urlholder"))))
    }
}
