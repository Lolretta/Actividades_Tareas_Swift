//
//  Pokemon_View.swift
//  Pokedex
//
//  Created by Lolretta on 29/10/25.
//

import SwiftUI

struct PokemonList_View: View {
    
    @State var pokemonViewModel = PokemonViewModel().dummyData()
    
    var body: some View {
        
        NavigationView {
            ScrollView(.vertical){
                VStack(alignment: .center){
                    ForEach(pokemonViewModel, id: \.uuid) { card in
                        
                        let backColor: Color = card.tipo.first.flatMap { card_data[$0]?.color } ?? .gray
                        
                        NavigationLink(destination: PokemonDetail_View(
                            background_color: backColor,
                            pokemon: card
                        )) {
                            
                            CardPokemon_View(
                                img: card.image,
                                name: card.name,
                                tipo: card.tipo
                            )
                        }
                    }
                }
            }
        }
        
    }
}

#Preview {
    PokemonList_View()
}
