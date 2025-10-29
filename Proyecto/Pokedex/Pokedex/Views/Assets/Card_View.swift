//
//  Card_View.swift
//  Pokedex
//
//  Created by Lolretta on 28/10/25.
//

import SwiftUI

struct Chip: View {
    var tipo: String
    var info: TipoInfo
    
    var body: some View {
        HStack(spacing: 4) {
            Text(tipo)
                .foregroundStyle(.white)
                .fontWeight(.bold)
                .font(.caption2)
            Text(info.emoji)
                .font(.caption2)
        }
        .padding(.horizontal, 8)
        .frame(height: 25)
        .background(info.color.opacity(0.25))
        .overlay(
            RoundedRectangle(cornerRadius: 30)
                .stroke(info.color, lineWidth: 1)
        )
        .cornerRadius(30)
    }
}

struct Card_View: View {
    var img: String
    var name: String
    var tipo: [String]
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15).fill(Color(red: 0.173, green: 0.173, blue: 0.173))
            
            HStack {
                
                VStack {
                    Image(img)
                        .resizable()
                        .frame(width: 80, height: 80)
                    
                    Text(name).foregroundStyle(.white).fontWeight(.bold)
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                // Chips de tipos
                VStack() {
                    ForEach(tipo, id: \.self) { t in
                        Chip(tipo: t, info: card_data[t]!)
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .frame(height: 120)
        .padding()
    }
}

#Preview {
    VStack {
        Card_View(img: "gengar", name: "Gengar", tipo: ["Veneno", "Fantasma"])
    }
}
