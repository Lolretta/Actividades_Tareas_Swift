//
//  Pokemon_View.swift
//  Pokedex
//
//  Created by Lolretta on 29/10/25.
//

import SwiftUI

struct PokemonList_View: View {
    
    @State var cardViewModel = PokemonViewModel().dummyData()
    
    var body: some View {
        
        ScrollView(.vertical){
            VStack(alignment: .center){
                ForEach(cardViewModel, id: \.uuid) { card in
                    Card_View(
                        img: card.image,
                        name: card.name,
                        tipo: card.tipo
                    )
                }
            }
        }
        
    }
}

#Preview {
    PokemonList_View()
}
