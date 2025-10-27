//
//  PointsView.swift
//  Tarea_05
//
//  Created by Lolretta on 24/10/25.
//

import SwiftUI

struct MoneyView: View {
    
    @State var saldo: Double
    @State private var showingSheet = false
    
    var body: some View {
        ZStack() {
            
            RoundedRectangle(cornerRadius: 15).fill(Color(red: 0.11, green: 0.11, blue: 0.118))
            
            HStack {
                   
                VStack (alignment: .leading) {
                    
                    Text("Saldo").foregroundStyle(.white)
                    Text(String(format: "$%.2f", saldo)).foregroundStyle(.white).fontWeight(.bold).font(.title)
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                Button(action: {
                    showingSheet.toggle()
                }) {
                    Text("Añadir saldo")
                        .padding(.horizontal, 15)
                        .padding(.vertical, 10)
                        .fontWeight(.medium)
                        .background(Color.white)
                        .foregroundColor(.black)
                        .cornerRadius(30)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .sheet(isPresented: $showingSheet) {
                    SheetView(saldo: $saldo)
                }
                
            }
            
        }
        .padding()
        .frame(height: 130)
    }
    
}

#Preview {
    MoneyView(saldo: 599.99)
}
