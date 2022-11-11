//
//  PokeView.swift
//  Pokedex
//
//  Created by Rutvi Shah on 11/9/22.
//

import SwiftUI
import Kingfisher

struct PokeView: View {
    @ObservedObject var viewModel = PokemonViewModel(offset: 0)
    @State var index : Int = 1;
    @State var offset : Int = 20;
    @State var largeImageURL : String = " ";
    
    let columns = [GridItem(.adaptive(minimum: 100))]
    var body: some View {
        NavigationView{
            VStack{
                KFImage(URL(string: largeImageURL))
                    .resizable()
                    .scaledToFit()
                    .padding(.bottom, 8)

                ScrollView{
                    LazyVGrid(columns: columns, spacing:10){
                        ForEach(viewModel.pokemonImage){ pokemonImage in
                            PokeCell(pokemonImage: pokemonImage)
                                .onAppear(perform:{
                                    if(index == viewModel.pokemonImage.count){
                                        viewModel.fetchPokemonURL(offset: offset)
                                        offset += 20
                                    }
                                    index += 1
                                })
                                .onTapGesture {
                                    largeImageURL = (pokemonImage.sprites).front_default
                                }
                        }
                    }
                }
            }
        }
    }
}


struct PokeView_Previews: PreviewProvider {
    static var previews: some View {
        PokeView()
    }
}
