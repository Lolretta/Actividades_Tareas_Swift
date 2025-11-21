//
//  PokedexApp.swift
//  Pokedex
//
//  Created by Lolretta on 27/10/25.
//

import SwiftUI

@main
struct PokedexApp: App {
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environment(\.locale, .init(identifier: "es"))
        }
    }
}
