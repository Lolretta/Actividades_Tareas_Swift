//
//  ContentView.swift
//  Act_04
//
//  Created by Lolretta on 04/10/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var tarjetasCongeladas = false
    @State var cardViewModel = CardViewModel().dummyData()
    
    @State private var preferredId: UUID? = nil
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        
        VStack {
            Toggle(isOn: $tarjetasCongeladas) {
                Text("Bloquear Tarjetas")
            }
            .frame(alignment: .center)
            
            if tarjetasCongeladas {
                GroupBox(){
                    Text("Tarjetas Bloquedas")
                }
            }
            

        }
        .padding(.horizontal, 50.0)
        .frame(maxWidth: .infinity)
 
                
        ScrollView(.vertical){
            VStack(alignment: .center){
                ForEach(cardViewModel, id: \.uuid) { card in
                    
                    let isPreferredBinding = Binding<Bool>(
                        get: { preferredId == card.uuid },
                        set: { newValue in
                            if newValue {
                                preferredId = card.uuid
                                alertMessage = "Tarjeta de \(card.banco) ha sido establecida como método preferido de pago"
                                showAlert = true
                            }
                        }
                    )
                    
                    CardView(
                        color_tarjeta: tarjetasCongeladas ? .gray : card.color, candado: tarjetasCongeladas ? "lock.fill" : card.candado,
                        banco: card.banco,
                        banco_img: card.banco_img,
                        tarjeta: card.tarjeta,
                        beneficiario: card.beneficiario,
                        tipo: card.tipo,
                        isPreferred: isPreferredBinding
                    ).modifier(CardViewModifier())
                }
                .alert("Marcado como favorito", isPresented: $showAlert) {
                    Button("OK", role: .cancel) { }
                } message: {
                    Text(alertMessage)
                }
                
            }
        }

    }
}

#Preview {
    ContentView()
}
