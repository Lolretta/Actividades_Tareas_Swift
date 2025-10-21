//
//  Card.swift
//  Act_04
//
//  Created by Lolretta on 17/10/25.
//

import Foundation
import SwiftUI

struct Card : Identifiable {
        
    let id: Int
    let uuid: UUID = UUID()
    let candado: String
    let color: Color
    let banco: String
    let banco_img: String
    let tarjeta: String
    let beneficiario: String
    let tipo: Int
    
}
