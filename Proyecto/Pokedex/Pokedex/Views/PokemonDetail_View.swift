//
//  PokemonDetail_View.swift
//  Pokedex
//
//  Created by Lolretta on 29/10/25.
//

import SwiftUI

struct PokemonDetail_View: View {
    
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
            
            Image(pokemon.image).resizable().frame(width: 100, height: 100).padding(0)
            
            ScrollView {
                
                VStack (spacing: 20) {
                    
                    HStack {
                        ForEach(pokemon.tipo, id: \.self) { t in
                            Chip(tipo: t, info: card_data[t]!)
                        }
                    }
                    
                    Text("About").foregroundStyle(background_color).fontWeight(.bold)
                    
                    HStack (spacing: 50) {
                        VStack (spacing: 10) {
                            HStack {
                                Image(systemName: "scalemass").foregroundStyle(.black)
                                Text(String(pokemon.peso) + " kg").foregroundStyle(.black)
                            }
                            Text("Weight").foregroundStyle(.black)
                        }
                        Divider()
                        VStack (spacing: 10) {
                            HStack {
                                Image(systemName: "ruler").rotationEffect(.degrees(90)).foregroundStyle(.black)
                                Text(String(pokemon.altura) + " m").foregroundStyle(.black)
                            }
                            Text("Height").foregroundStyle(.black)
                        }
                    }
                    .frame(height: 40)
                    
                    Text("Pikachu that can generate powerful electricity have cheek sacs that are extra soft and super stretchy.").font(.caption).foregroundStyle(.black)
                    
                    Text("Base Stats").foregroundStyle(background_color).fontWeight(.bold)
                    
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

#Preview {
    PokemonDetail_View(
        background_color: Color(hue: 0.14, saturation: 1.0, brightness: 1.0),
        pokemon: Pokemon (
            id: 4,
            image: "pikachu",
            name: "Pikachu",
            tipo: ["Eléctrico"],
            rareza: "Comun",
            altura: 0.4,
            peso: 6.0,
            BaseStats: [Stats(hp: 35, attack: 55, defense: 40, specialAttack: 50, specialDefense: 50, speed: 90)],
            MaxStats: [Stats(hp: 180, attack: 103, defense: 76, specialAttack: 94, specialDefense: 94, speed: 166)],
            movs: [
                "Impactrueno": Movs(type: "Eléctrico", power: 40, accuracy: 100),
                "Gruñido": Movs(type: "Normal", power: 0, accuracy: 100),
                "Ataque Rápido": Movs(type: "Normal", power: 40, accuracy: 100),
                "Chispa": Movs(type: "Eléctrico", power: 65, accuracy: 100),
                "Rayo": Movs(type: "Eléctrico", power: 90, accuracy: 100),
                "Onda Trueno": Movs(type: "Eléctrico", power: 0, accuracy: 90),
                "Puño Trueno": Movs(type: "Eléctrico", power: 75, accuracy: 100),
                "Cola Férrea": Movs(type: "Acero", power: 100, accuracy: 75),
                "Doble Equipo": Movs(type: "Normal", power: 0, accuracy: 0),
                "Rayo Carga": Movs(type: "Eléctrico", power: 50, accuracy: 90),
                "Chispazo": Movs(type: "Eléctrico", power: 80, accuracy: 100),
                "Placaje Eléctrico": Movs(type: "Eléctrico", power: 120, accuracy: 100),
                "Voltiocambio": Movs(type: "Eléctrico", power: 70, accuracy: 100),
                "Trueno": Movs(type: "Eléctrico", power: 110, accuracy: 70)
            ]
        )
    )
}
