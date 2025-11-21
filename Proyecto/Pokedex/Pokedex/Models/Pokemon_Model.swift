//
//  Pokemon_Model.swift
//  Pokedex
//
//  Created by Lolretta on 29/10/25.
//

import Foundation

struct Stats: Codable {
    let hp: Int
    let attack: Int
    let defense: Int
    let specialAttack: Int
    let specialDefense: Int
    let speed: Int
}

extension Stats {
    static let maxStatsGlobal = Stats(
        hp: 300,
        attack: 300,
        defense: 300,
        specialAttack: 300,
        specialDefense: 300,
        speed: 300
    )
}


struct Movs: Codable {
    let type: String
    let power: Int
    let accuracy: Int
}

struct Pokemon: Identifiable {
    let id: Int
    let uuid: UUID = UUID()
    let image: String
    let name: String
    let tipo: [String]
    let rareza: String
    let altura: Float
    let peso: Float
    let BaseStats: [Stats]
    let MaxStats: [Stats]
    let movs: [String: Movs]
}
