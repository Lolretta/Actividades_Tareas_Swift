//
//  PokemonList_View.swift
//  Pokedex
//

import SwiftUI

struct PokemonList_View: View {
    
    @ObservedObject var viewModel: PokemonViewModel
    @State private var searchText: String = ""
    
    private var pokemonsToShow: [Pokemon] {
        let trimmed = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        if trimmed.isEmpty {
            return viewModel.pokemons
        } else {
            return viewModel.searchResults
        }
    }
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack(alignment: .center) {
                    
                    // Buscador
                    TextField("Buscar pokemon...", text: $searchText)
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(12)
                        .padding(.horizontal)
                        .onChange(of: searchText) { _, newValue in
                            Task {
                                await viewModel.searchPokemons(by: newValue)
                            }
                        }
                    
                    // Lista
                    ForEach(pokemonsToShow, id: \.uuid) { card in
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
            .navigationTitle("Pokedex")
        }
        .task {
            await viewModel.loadInitialPokemons()
        }
    }
}

#Preview {
    PokemonList_View(viewModel: PokemonViewModel())
}
