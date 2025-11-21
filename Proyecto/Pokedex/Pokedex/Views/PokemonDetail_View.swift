//
//  PokemonDetail_View.swift
//  Pokedex
//
//  Created by Lolretta on 29/10/25.
//

import SwiftUI

struct PokemonDetail_View: View {
    
    let about: String = String(localized: "about")
    let weight: String = String(localized: "weight")
    let height: String = String(localized: "height")
    let stats: String = String(localized: "stats")
    
    let info: String = String(localized: "info")
    
    let background_color: Color
    let pokemon: Pokemon
    
    private var base: Stats {
        pokemon.BaseStats.first ?? Stats(hp: 0, attack: 0, defense: 0, specialAttack: 0, specialDefense: 0, speed: 0)
    }
    private var maxs: Stats {
        pokemon.MaxStats.first ?? Stats(hp: 1, attack: 1, defense: 1, specialAttack: 1, specialDefense: 1, speed: 1)
    }
    
    var body: some View {
        
        VStack {
            
            Text(pokemon.name)
                .foregroundStyle(.white)
                .font(.title)
                .fontWeight(.bold)
            
            AsyncImage(url: URL(string: pokemon.image)) { image in
                image
                    .resizable()
                    .frame(width: 100, height: 100)
            } placeholder: {
                ProgressView()
                    .frame(width: 100, height: 100)
            }
            .padding(0)

            
            ScrollView {
                
                VStack (spacing: 20) {
                    
                    HStack {
                        ForEach(pokemon.tipo, id: \.self) { t in
                            Chip(tipo: t, info: card_data[t]!)
                        }
                    }
                    
                    Text(about).foregroundStyle(background_color).fontWeight(.bold)
                    
                    HStack (spacing: 50) {
                        VStack (spacing: 10) {
                            HStack {
                                Image(systemName: "scalemass").foregroundStyle(.black)
                                Text(String(pokemon.peso) + " kg").foregroundStyle(.black)
                            }
                            Text(weight).foregroundStyle(.black)
                        }
                        Divider()
                        VStack (spacing: 10) {
                            HStack {
                                Image(systemName: "ruler").rotationEffect(.degrees(90)).foregroundStyle(.black)
                                Text(String(pokemon.altura) + " m").foregroundStyle(.black)
                            }
                            Text(height).foregroundStyle(.black)
                        }
                    }
                    .frame(height: 40)
                    
                    Text(info).font(.caption).foregroundStyle(.black)
                    
                    Text(stats).foregroundStyle(background_color).fontWeight(.bold)
                    
                    StatsOnlyView(base: base, max: maxs, color: background_color, perRowDelay: 0.06)
                    
                    LazyVStack(spacing: 12) {
                        ForEach(Array(pokemon.movs.sorted(by: { $0.key < $1.key })), id: \.key) { entry in
                            CardMov_View(name: entry.key, mov: entry.value)
                        }
                    }
                    
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .background(.white)
                .cornerRadius(20)
                .padding(5)
            }
            .cornerRadius(20)
            
            
            
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(background_color)
        .cornerRadius(20)
        .padding(10)
        
    }
}
