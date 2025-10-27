//
//  TransactionsView.swift
//  Tarea_05
//
//  Created by Lolretta on 22/10/25.
//

import SwiftUI

struct CardDetailView: View {
    
    var transactions: [Transaction]
    
    var numero: String
    var nombre: String
    var tipo: Int
    var operador: Int
    
    var body: some View {
        
        CardView(
            numero: numero,
            nombre: nombre,
            tipo: tipo,
            operador: operador
        ).modifier(CardViewModifier())
        
        if (tipo != 1) {
            MoneyView(saldo: 0)
        }

        ScrollView(){
            
            VStack(alignment: .center){
                 
                ForEach(transactions) { transaction in
                    TransactionView(
                        tipo: tipo,
                        monto: transaction.monto,
                        descripcion: transaction.descripcion,
                        lugarCompra: transaction.lugarCompra
                    )
                }
                
            }
            
            
        }
        
    }
}

#Preview {
    CardDetailView(
        transactions: [
            Transaction(id: 1, monto: 150.0, descripcion: "Compra en OXXO", lugarCompra: "OXXO"),
            Transaction(id: 2, monto: 300.5, descripcion: "Compra en Walmart", lugarCompra: "Walmart"),
            Transaction(id: 3, monto: 99.99, descripcion: "Compra en iShop", lugarCompra: "iShop")
        ],
        numero: "1234 5678 9012 3456",
        nombre: "José Iván Retta Ramírez",
        tipo: 2,
        operador: 1
    )
}
