//
//  FavoritesList_View.swift
//  Pokedex
//
//  Created by Lolretta on 21/11/25.
//

import SwiftUI

struct FavoritesList_View: View {
    
    @ObservedObject var viewModel: PokemonViewModel
    
    var body: some View {
        NavigationView {
            if viewModel.favoritePokemons.isEmpty {
                VStack {
                    Text("Todavia no tienes pokémon favoritos.")
                        .foregroundStyle(.secondary)
                        .padding()
                    Spacer()
                }
                .navigationTitle("Favoritos")
            } else {
                ScrollView {
                    VStack(alignment: .center) {
                        ForEach(viewModel.favoritePokemons, id: \.uuid) { card in
                            let backColor: Color =
                                card.tipo.first.flatMap { card_data[$0]?.color } ?? .gray
                            
                            NavigationLink(
                                destination: PokemonDetail_View(
                                    background_color: backColor,
                                    pokemon: card
                                )
                            ) {
                                CardPokemon_View(
                                    img: card.image,
                                    name: card.name,
                                    tipo: card.tipo,
                                    isFavorite: viewModel.isFavorite(card),
                                    onToggleFavorite: {
                                        viewModel.toggleFavorite(for: card)
                                    }
                                )
                            }
                        }
                    }
                }
                .navigationTitle("Favoritos")
            }
        }
    }
}

#Preview {
    FavoritesList_View(viewModel: PokemonViewModel())
}
