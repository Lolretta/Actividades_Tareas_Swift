//
//  CardView.swift
//  Act_04
//
//  Created by Lolretta on 06/10/25.
//

import SwiftUI

struct CardView: View {

    var color_tarjeta: Color
    var candado: String
    var banco: String
    var banco_img: String
    var tarjeta: String
    var beneficiario: String
    var tipo: Int
    
    @Binding var isPreferred: Bool


    var body: some View {
        ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 15).fill(color_tarjeta)

            VStack(spacing: 8) {
                
                HStack {
                    Text(banco)
                        .font(.title2)
                        .foregroundStyle(.white)

                    Image(banco_img)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 30)

                    Spacer()

                    Image(systemName: candado)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 30)
                        .foregroundStyle(.white)
                    
                }
                .padding(.trailing)
                .frame(maxWidth: .infinity, alignment: .leading)

                Text(tarjeta)
                    .modifier(TextViewModifier(tamanio: .title3))

                Text(beneficiario)
                    .modifier(TextViewModifier(tamanio: .callout))

                HStack(spacing: 20) {
                    
                    Button {isPreferred = true} label: {
                        Image(systemName: isPreferred ? "star.fill" : "star")
                            .foregroundColor(isPreferred ? .yellow : .white)
                    }

                    
                    Spacer()

                    if tipo == 1 {
                        MasterCard()
                    } else {
                        Visa()
                    }
                    
                }
                .padding(.leading, 5)
                .frame(maxWidth: .infinity, alignment: .leading)
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
    CardView(
        color_tarjeta: .red,
        candado: "lock.fill.open",
        banco: "Banamex",
        banco_img: "banamex",
        tarjeta: "0123 4567 8901 2345",
        beneficiario: "Jose Ivan Retta Ramirez",
        tipo: 1,
        isPreferred: .constant(false)
    )
}
