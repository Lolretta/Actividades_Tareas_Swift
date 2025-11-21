//
//  MainTabView.swift
//  Pokedex
//
//  Created by Lolretta on 21/11/25.
//

import SwiftUI

struct MainTabView: View {
    
    @StateObject private var viewModel = PokemonViewModel()
    
    var body: some View {
        TabView {
            PokemonList_View(viewModel: viewModel)
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Todos")
                }
            
            FavoritesList_View(viewModel: viewModel)
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Favoritos")
                }
        }
    }
}

#Preview {
    MainTabView()
}
