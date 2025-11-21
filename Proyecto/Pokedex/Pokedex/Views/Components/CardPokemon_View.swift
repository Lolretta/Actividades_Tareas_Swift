//
//  CardPokemon_View.swift
//  Pokedex
//

import SwiftUI

struct Chip: View {
    var tipo: String
    var info: TipoInfo
    
    var body: some View {
        HStack(spacing: 4) {
            Text(tipo)
                .font(.system(size: 14))
                .foregroundStyle(.white)
            Text(info.emoji)
        }
        .padding(.vertical, 4)
        .padding(.horizontal, 12)
        .background(info.color)
        .cornerRadius(20)
    }
}

struct CardPokemon_View: View {
    var img: String
    var name: String
    var tipo: [String]
    var isFavorite: Bool
    var onToggleFavorite: () -> Void
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color(red: 0.173, green: 0.173, blue: 0.173))
            
            HStack {
                
                VStack {
                    AsyncImage(url: URL(string: img)) { image in
                        image
                            .resizable()
                            .frame(width: 80, height: 80)
                    } placeholder: {
                        ProgressView()
                            .frame(width: 80, height: 80)
                    }
                    
                    Text(name)
                        .foregroundStyle(.white)
                        .fontWeight(.bold)
                }
                .padding()
                .frame(maxWidth: .infinity,
                       maxHeight: .infinity)
                
                VStack {
                    ForEach(tipo, id: \.self) { t in
                        Chip(tipo: t, info: card_data[t]!)
                    }
                }
                .padding()
                .frame(maxWidth: .infinity,
                       maxHeight: .infinity)
            }
        }
        .frame(height: 120)
        .padding()
        .overlay(alignment: .topTrailing) {
            Button(action: {
                onToggleFavorite()
            }) {
                Image(systemName: isFavorite ? "star.fill" : "star")
                    .foregroundStyle(.yellow)
                    .padding(8)
                    
            }
            .padding(.top, 8)
            .padding(.trailing, 20)
        }
    }
}

#Preview {
    VStack {
        CardPokemon_View(
            img: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/94.png",
            name: "Gengar",
            tipo: ["Ghost", "Poison"],
            isFavorite: true,
            onToggleFavorite: {}
        )
    }
    .padding()
    .background(Color.black)
}
