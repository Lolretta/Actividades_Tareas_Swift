//
//  CardMov_View.swift
//  Pokedex
//
//  Created by Lolretta on 29/10/25.
//

import SwiftUI

struct CardMov_View: View {
    let name: String
    let mov: Movs
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.secondarySystemBackground))
            
            HStack(spacing: 12) {
                VStack(alignment: .leading, spacing: 6) {
                    Text(name)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                    
                    HStack(spacing: 12) {
                        Text("Pow: \(mov.power)")
                            .font(.caption2)
                            .foregroundColor(.secondary)
                        Text("Acc: \(mov.accuracy)")
                            .font(.caption2)
                            .foregroundColor(.secondary)
                    }
                }
                .padding(.leading, 12)
                
                Spacer()
                
                Chip(tipo: mov.type, info: card_data[mov.type]!).padding()
            }
            .frame(height: 72)
        }
        .frame(height: 72)
        .padding(.horizontal)
    }
}

struct CardMov_View_Previews: PreviewProvider {
    static let sampleMovs: [String: Movs] = [
        "Placaje": Movs(type: "Normal", power: 40, accuracy: 100),
        "Gruñido": Movs(type: "Normal", power: 0, accuracy: 100),
        "Látigo Cepa": Movs(type: "Planta", power: 45, accuracy: 100),
        "Somnífero": Movs(type: "Planta", power: 0, accuracy: 75),
        "Drenadoras": Movs(type: "Planta", power: 0, accuracy: 90),
        "Hoja Afilada": Movs(type: "Planta", power: 55, accuracy: 95),
        "Polvo Veneno": Movs(type: "Veneno", power: 0, accuracy: 75),
        "Bomba Lodo": Movs(type: "Veneno", power: 90, accuracy: 100),
        "Síntesis": Movs(type: "Planta", power: 0, accuracy: 0),
        "Gigadrenado": Movs(type: "Planta", power: 75, accuracy: 100),
        "Rayo Solar": Movs(type: "Planta", power: 120, accuracy: 100),
        "Beso Drenaje": Movs(type: "Hada", power: 50, accuracy: 100)
    ]
    
    static var previews: some View {
        Group {
            CardMov_View(name: "Placaje", mov: sampleMovs["Placaje"]!)
                .previewLayout(.sizeThatFits)
        }
    }
}
