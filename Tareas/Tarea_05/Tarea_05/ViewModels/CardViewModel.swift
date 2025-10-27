//
//  CardViewModel.swift
//  Tarea_05
//
//  Created by Lolretta on 21/10/25.
//

import Foundation

struct CardViewModel {
    
    let stores_cats: [Int: [String]] = [
        1: ["OXXO", "Walmart", "iShop", "China Store"],
        2: ["Urban", "Tren", "Didi", "Metro Bus", "Metro"],
        3: ["Liverpool", "Sears", "C&A", "Play Station", "Apple Store"]
    ]
    
    private func store(cat: Int) -> String {
        stores_cats[cat]?.randomElement() ?? "Desconocido"
    }
    
    func CardTransactions(tipo:Int) -> [Transaction] {
        var Transactions: [Transaction] = []
        let storeFixed = store(cat: tipo)
        
        for x in 1 ... 5 {
            let cantidad = Double.random(in: 10...1000)
            let lugar = (tipo == 1) ? store(cat: tipo) : storeFixed
            Transactions.append(
                Transaction(
                    id: x,
                    monto: cantidad,
                    descripcion: "Compra por $\(String(format: "%.2f", cantidad)) en \(lugar)",
                    lugarCompra: lugar
                )
            )
        }
        
        return Transactions
    }
    
    func generateCardNumber() -> String {
        let digits = (0..<16).map { _ in String(Int.random(in: 0...9)) }.joined()
        var formatted = ""
        for (i, ch) in digits.enumerated() {
            if i > 0 && i % 4 == 0 { formatted.append(" ") }
            formatted.append(ch)
        }
        return formatted
    }
    
    func CardData() -> [Card] {
        var Cards: [Card] = []
        
        for x in 1 ... 6 {
            let tipo = (x - 1) % 3 + 1
            Cards.append(
                Card(
                    id: x,
                    numero: generateCardNumber(),
                    nombre: "José Iván Retta Ramírez",
                    tipo_tarjeta: tipo,
                    operador: tipo,
                    transactions: CardTransactions(tipo: tipo)
                )
            )
        }

        
        return Cards
    }
        
}
