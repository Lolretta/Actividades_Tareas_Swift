//
//  StatsChart_View.swift
//  Pokedex
//
//  Created by Lolretta on 29/10/25.
//

import SwiftUI

// Barra individual
struct StatRowCompact: View {
    let label: String
    let base: Int
    let max: Int
    let fillColor: Color
    var delay: Double = 0.0
    var duration: Double = 0.55

    @State private var animate = false

    private var ratio: Double {
        guard max > 0 else { return 0 }
        return min(Double(base) / Double(max), 1.0)
    }

    var body: some View {
        HStack(spacing: 12) {
            Text(label)
                .font(.caption2)
                .fontWeight(.bold)
                .frame(width: 36, alignment: .leading)
                .foregroundStyle(fillColor)

            Text(String(format: "%03d", base))
                .font(.caption2)
                .frame(width: 36, alignment: .leading)
                .foregroundColor(.black)

            GeometryReader { g in
                ZStack(alignment: .leading) {
                    Capsule()
                        .fill(Color.primary.opacity(0.12))
                        .frame(height: 8)

                    Capsule()
                        .fill(fillColor)
                        .frame(width: animate ? Swift.max(6, g.size.width * CGFloat(ratio)) : 0, height: 8)
                        .cornerRadius(4)
                }
            }
            .frame(height: 12)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                withAnimation(.easeOut(duration: duration)) {
                    animate = true
                }
            }
        }
        .onDisappear {
            animate = false
        }
    }
}

// Toda la chart
struct StatsOnlyView: View {
    let base: Stats
    let max: Stats
    let color: Color

    var perRowDelay: Double = 0.06

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            StatRowCompact(label: "HP",   base: base.hp,  max: max.hp,  fillColor: color, delay: perRowDelay * 0)
            StatRowCompact(label: "ATK",  base: base.attack, max: max.attack, fillColor: color, delay: perRowDelay * 1)
            StatRowCompact(label: "DEF",  base: base.defense, max: max.defense, fillColor: color, delay: perRowDelay * 2)
            StatRowCompact(label: "SATK", base: base.specialAttack, max: max.specialAttack, fillColor: color, delay: perRowDelay * 3)
            StatRowCompact(label: "SDEF", base: base.specialDefense, max: max.specialDefense, fillColor: color, delay: perRowDelay * 4)
            StatRowCompact(label: "SPD",  base: base.speed, max: max.speed, fillColor: color, delay: perRowDelay * 5)
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 6)
    }
}

// Preview rápido
struct StatsOnlyView_Previews: PreviewProvider {
    static var previews: some View {
        let base = Stats(hp: 35, attack: 55, defense: 40, specialAttack: 50, specialDefense: 50, speed: 90)
        let maxs = Stats(hp: 180, attack: 103, defense: 76, specialAttack: 94, specialDefense: 94, speed: 166)
        StatsOnlyView(base: base, max: maxs, color: Color(hue: 0.14, saturation: 1.0, brightness: 1.0))
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
