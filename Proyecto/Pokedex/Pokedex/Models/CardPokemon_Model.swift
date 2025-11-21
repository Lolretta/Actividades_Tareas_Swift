//
//  CardUI_Model.swift
//  Pokedex
//
//  Created by Lolretta on 28/10/25.
//

import SwiftUI

struct TipoInfo {
    let color: Color
    let emoji: String
}

let card_data: [String: TipoInfo] = [
    "Agua": TipoInfo(color: Color(hue: 0.55, saturation: 0.4, brightness: 1.0), emoji: "🌊"),
    "Fuego": TipoInfo(color: Color(hue: 0.02, saturation: 0.9, brightness: 0.95), emoji: "🔥"),
    "Planta": TipoInfo(color: Color(hue: 0.33, saturation: 0.7, brightness: 0.8), emoji: "🍃"),
    "Eléctrico": TipoInfo(color: Color(hue: 0.14, saturation: 1.0, brightness: 1.0), emoji: "⚡️"),
    "Roca": TipoInfo(color: Color(hue: 0.08, saturation: 0.6, brightness: 0.55), emoji: "🪨"),
    "Tierra": TipoInfo(color: Color(hue: 0.10, saturation: 0.5, brightness: 0.85), emoji: "🧑‍🌾"),
    "Normal": TipoInfo(color: Color(hue: 0.0, saturation: 0.0, brightness: 0.8), emoji: "🐾"),
    "Lucha": TipoInfo(color: Color(hue: 0.05, saturation: 0.8, brightness: 0.9), emoji: "💪"),
    "Siniestro": TipoInfo(color: Color(hue: 0.65, saturation: 0.1, brightness: 0.15), emoji: "🌑"),
    "Acero": TipoInfo(color: Color(hue: 0.60, saturation: 0.0, brightness: 0.75), emoji: "⚙️"),
    "Psíquico": TipoInfo(color: Color(hue: 0.9, saturation: 0.8, brightness: 1.0), emoji: "💫"),
    "Fantasma": TipoInfo(color: Color(hue: 0.75, saturation: 0.6, brightness: 0.5), emoji: "👻"),
    "Bicho": TipoInfo(color: Color(hue: 0.28, saturation: 0.8, brightness: 0.8), emoji: "🐛"),
    "Veneno": TipoInfo(color: Color(hue: 0.77, saturation: 0.7, brightness: 0.6), emoji: "💀"),
    "Volador": TipoInfo(color: Color(hue: 0.55, saturation: 0.2, brightness: 1.0), emoji: "☁️"),
    "Hada": TipoInfo(color: Color(hue: 0.95, saturation: 0.4, brightness: 1.0), emoji: "✨"),
    "Hielo": TipoInfo(color: Color(hue: 0.55, saturation: 0.15, brightness: 1.0), emoji: "❄️"),
    "Water": TipoInfo(color: Color(hue: 0.55, saturation: 0.4, brightness: 1.0), emoji: "🌊"),
    "Fire": TipoInfo(color: Color(hue: 0.02, saturation: 0.9, brightness: 0.95), emoji: "🔥"),
    "Grass": TipoInfo(color: Color(hue: 0.33, saturation: 0.7, brightness: 0.8), emoji: "🍃"),
    "Electric": TipoInfo(color: Color(hue: 0.14, saturation: 1.0, brightness: 1.0), emoji: "⚡️"),
    "Rock": TipoInfo(color: Color(hue: 0.08, saturation: 0.6, brightness: 0.55), emoji: "🪨"),
    "Ground": TipoInfo(color: Color(hue: 0.10, saturation: 0.5, brightness: 0.85), emoji: "🧑‍🌾"),
    "Fighting": TipoInfo(color: Color(hue: 0.05, saturation: 0.8, brightness: 0.9), emoji: "💪"),
    "Dark": TipoInfo(color: Color(hue: 0.65, saturation: 0.1, brightness: 0.15), emoji: "🌑"),
    "Steel": TipoInfo(color: Color(hue: 0.60, saturation: 0.0, brightness: 0.75), emoji: "⚙️"),
    "Psychic": TipoInfo(color: Color(hue: 0.9, saturation: 0.8, brightness: 1.0), emoji: "💫"),
    "Ghost": TipoInfo(color: Color(hue: 0.75, saturation: 0.6, brightness: 0.5), emoji: "👻"),
    "Bug": TipoInfo(color: Color(hue: 0.28, saturation: 0.8, brightness: 0.8), emoji: "🐛"),
    "Poison": TipoInfo(color: Color(hue: 0.77, saturation: 0.7, brightness: 0.6), emoji: "💀"),
    "Flying": TipoInfo(color: Color(hue: 0.55, saturation: 0.2, brightness: 1.0), emoji: "☁️"),
    "Fairy": TipoInfo(color: Color(hue: 0.95, saturation: 0.4, brightness: 1.0), emoji: "✨"),
    "Ice": TipoInfo(color: Color(hue: 0.55, saturation: 0.15, brightness: 1.0), emoji: "❄️"),
    "Dragon": TipoInfo(color: Color(hue: 0.65, saturation: 0.6, brightness: 0.8), emoji: "🐉")
]

