//
//  CardViewModel.swift
//  Act_04
//
//  Created by Lolretta on 17/10/25.
//

import Foundation
import SwiftUI

struct CardViewModel{
    
    func generateCardNumber() -> String {
        let digits = (0..<16).map { _ in String(Int.random(in: 0...9)) }.joined()
        var formatted = ""
        for (i, ch) in digits.enumerated() {
            if i > 0 && i % 4 == 0 { formatted.append(" ") }
            formatted.append(ch)
        }
        return formatted
    }
    
    func dummyData() -> [Card] {
        
        let Cards: [Card] = [
            Card(id: 1, candado: "lock.open.fill", color: Color(red: 0.51, green: 0.039, blue: 0.819), banco: "NU", banco_img: "nu", tarjeta: generateCardNumber(), beneficiario: "José Iván Retta Ramírez", tipo: 1),
            
            Card(id: 2, candado: "lock.open.fill", color: Color.red, banco: "Banamex", banco_img: "banamex", tarjeta: generateCardNumber(), beneficiario: "José Iván Retta Ramírez", tipo: 2),
            
            Card(id: 3, candado: "lock.open.fill", color: Color(red: -0.007, green: 0.745, blue: 0.42), banco: "Stori", banco_img: "stori", tarjeta: generateCardNumber(), beneficiario: "José Iván Retta Ramírez", tipo: 2),
            
            Card(id: 4, candado: "lock.open.fill", color: Color.black, banco: "Hey Banco", banco_img: "hey", tarjeta: generateCardNumber(), beneficiario: "José Iván Retta Ramírez", tipo: 1),
            
            Card(id: 5, candado: "lock.open.fill", color: Color.blue, banco: "Mercado Pago", banco_img: "ml", tarjeta: generateCardNumber(), beneficiario: "José Iván Retta Ramírez", tipo: 2)
        ]
        
        return Cards
    }
}

