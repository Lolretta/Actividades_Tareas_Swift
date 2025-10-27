//
//  BankCardView.swift
//  Tarea_05
//
//  Created by Lolretta on 21/10/25.
//

import SwiftUI

struct CardView: View {
    
    let tipos: [String] = ["Bancaria 💵", "Transporte 🚌", "Puntos 🎁"]
    let colores: [Color] = [Color.purple, Color.red, Color.green]
    
    var numero: String
    var nombre: String
    var tipo: Int
    var operador: Int
    
    var body: some View {
        
        ZStack(alignment: .topLeading) {
            
            RoundedRectangle(cornerRadius: 15).fill(colores[tipo-1])

            VStack(spacing: 20) {

                HStack {
                    
                    Text(tipos[tipo-1])
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)

                    Spacer()

                    if (operador == 1) {
                        MasterCard()
                    } else if (operador == 2) {
                        TransportLogo()
                    } else {
                        PointsLogo()
                    }
                    
                }
                .padding(.trailing)
                .frame(maxWidth: .infinity)

                Text(numero)
                    .modifier(TextViewModifier())

                Text(nombre)
                    .modifier(TextViewModifier())

            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
        }
        .padding(.horizontal)
        .frame(height: 175)
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    CardView(numero: "1234 5678 9012 3456", nombre: "José Iván Retta Ramírez", tipo: 1, operador: 1)
}
