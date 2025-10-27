//
//  TransactionView.swift
//  Tarea_05
//
//  Created by Lolretta on 22/10/25.
//

import SwiftUI

struct TransactionView: View {
    
    let tipos: [String] = ["dollarsign.bank.building", "bus.fill", "star.fill"]
    
    var tipo: Int
    var monto: Double
    var descripcion: String
    var lugarCompra: String
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            
            RoundedRectangle(cornerRadius: 15).fill(Color.black)
            
            HStack {
                   
                ZStack() {
                    RoundedRectangle(cornerRadius: 15).fill(Color(red: 0.133, green: 0.133, blue: 0.133))
                    Image(systemName: tipos[tipo-1])
                        .resizable()
                        .padding()
                        .scaledToFit()
                        .foregroundStyle(.white)
                }
                .padding()
                .frame(width: 110)
                
                VStack (spacing: 15) {
                    
                    HStack {
                        Text(lugarCompra)
                            .foregroundStyle(.white)
                            .fontWeight(.bold)
                            .font(.title3)
                        Spacer()
                        Text(String(format: "- $%.2f", monto)).foregroundStyle(.red)
                    }
                    
                    Text(descripcion)
                        .foregroundStyle(Color(red: 0.502, green: 0.502, blue: 0.502))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
                .padding(.trailing)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
            }

            
        }
        .padding(.horizontal)
        .frame(height: 115)
    }
}

#Preview {
    TransactionView(tipo: 1, monto: 599.99, descripcion: "Compra de libros", lugarCompra: "Librería XYZ")
}
