//
//  Card.swift
//  Tarea_05
//
//  Created by Lolretta on 20/10/25.
//

import Foundation

struct Card: Identifiable {
    let id: Int
    let uuid: UUID = UUID()
    let numero: String
    let nombre: String
    let tipo_tarjeta: Int
    let operador: Int
    var transactions: [Transaction]
}
