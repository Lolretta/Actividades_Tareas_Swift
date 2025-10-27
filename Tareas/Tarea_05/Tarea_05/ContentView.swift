//
//  ContentView.swift
//  Tarea_05
//
//  Created by Lolretta on 20/10/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var cardViewModel = CardViewModel().CardData()
    
    var body: some View {
        
        NavigationView {
            ScrollView(.vertical){
                VStack(alignment: .center){
                    ForEach(cardViewModel, id: \.uuid) { card in
                        
                        NavigationLink(destination: CardDetailView(
                            transactions: card.transactions,
                            numero: card.numero,
                            nombre: card.nombre,
                            tipo: card.tipo_tarjeta,
                            operador: card.operador
                        )) {
                            CardView(
                                numero: card.numero,
                                nombre: card.nombre,
                                tipo: card.tipo_tarjeta,
                                operador: card.operador
                            ).modifier(CardViewModifier())
                        }
                    }
                    
                }
            }
        }
        
        
        
    }
}


#Preview {
    ContentView()
}
