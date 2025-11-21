//
//  MainTabView.swift
//  Pokedex
//
//  Created by Lolretta on 21/11/25.
//

import SwiftUI

struct MainTabView: View {
    
    let all: String = String(localized: "all")
    let favs: String = String(localized: "favs")
    
    @StateObject private var viewModel = PokemonViewModel()
    
    var body: some View {
        TabView {
            PokemonList_View(viewModel: viewModel)
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text(all)
                }
            
            FavoritesList_View(viewModel: viewModel)
                .tabItem {
                    Image(systemName: "star.fill")
                    Text(favs)
                }
        }
    }
}

#Preview {
    MainTabView()
}
