//
//  TransaccionModel.swift
//  Tarea_05
//
//  Created by Lolretta on 21/10/25.
//

import Foundation

struct Transaction: Identifiable {
    let id: Int
    let uuid: UUID = UUID()
    let monto: Double
    let descripcion: String
    let lugarCompra: String
}
