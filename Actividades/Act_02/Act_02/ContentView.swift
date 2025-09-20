//
//  ContentView.swift
//  Act_02
//
//  Created by Lolretta on 05/09/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        var frame: CGFloat = 225
        
        ScrollView(.horizontal) {
            
            
            HStack (spacing: 40) {
                
                VStack {
                    
                    // (alignment: .leading)
                    
                    ZStack (alignment: .topLeading) {
                        
                        Image("kimetsu")
                            .resizable()
                            .scaledToFit()
                            .frame(width: frame)
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                        
                        Text("Preventa")
                                .padding(.horizontal, 12)
                                .padding(.vertical, 6)
                                .background(Color(red: 0.216, green: 0.787, blue: 0.777))
                                .cornerRadius(10)
                                .padding(8)
                                .fontWeight(.bold)
                    } // Cierre ZStack
                    
                    HStack {
                        
                        Text("TBC")
                            .foregroundColor(Color(red: 0.276, green: 0.311, blue: 0.416))
                                .padding(.horizontal, 12)
                                .padding(.vertical, 6)
                                .background(Color(red: 0.765, green: 0.777, blue: 0.802))
                                .cornerRadius(5)
                                .padding(8)
                                .fontWeight(.bold)
                        
                        Text("155 min")
                        
                    } // Cierre HStack - TBC
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("Demon Slayer: Kimetsu no Yaiba Castillo Infinito")
                        .font(.title2)
                        .bold()
                        .lineLimit(2)
                        .truncationMode(.middle)
                        .multilineTextAlignment(.leading)
                        
                    HStack {
                        
                        Text("Ver detalle")
                            .foregroundStyle(.blue)
                            .fontWeight(.bold)
                            .underline()
                        Image(systemName: "info.circle")
                            .foregroundStyle(.blue)
                        
                    } // Cierre HStack - Detalle
                    .padding(.top, 10)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                } // Cierre VStack - Peli 1
                .frame(width: frame)
                
                VStack {
                    
                    ZStack (alignment: .topLeading) {
                        
                        Image("malos")
                            .resizable()
                            .scaledToFit()
                            .frame(width: frame)
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                        
                        Text("Estreno")
                                .padding(.horizontal, 12)
                                .padding(.vertical, 6)
                                .background(Color(red: 0.242, green: 0.428, blue: 0.983))
                                .cornerRadius(10)
                                .padding(8)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                    } // Cierre ZStack
                    
                    HStack {
                        
                        Text("A")
                            .foregroundColor(Color(red: 0.276, green: 0.311, blue: 0.416))
                                .padding(.horizontal, 12)
                                .padding(.vertical, 6)
                                .background(Color.green)
                                .cornerRadius(5)
                                .padding(8)
                                .fontWeight(.bold)
                        
                        Text("104 min")
                        
                    } // Cierre HStack - TBC
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("Tipos Malos 2")
                        .font(.title2)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                    HStack {
                        
                        Text("Ver detalle")
                            .foregroundStyle(.blue)
                            .fontWeight(.bold)
                            .underline()
                        Image(systemName: "info.circle")
                            .foregroundStyle(.blue)
                        
                    } // Cierre HStack - Detalle
                    .padding(.top, 10)
                    .frame(maxWidth: .infinity, alignment: .leading)
    
                } // Cierre VStack - Peli 3
                .frame(width: frame)
                
                VStack {
                    
                    ZStack (alignment: .topLeading) {
                        
                        Image("conjuro")
                            .resizable()
                            .scaledToFit()
                            .frame(width: frame)
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                        
                        Text("Estreno")
                                .padding(.horizontal, 12)
                                .padding(.vertical, 6)
                                .background(Color(red: 0.242, green: 0.428, blue: 0.983))
                                .cornerRadius(10)
                                .padding(8)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                    } // Cierre ZStack
    
                    HStack {
                        
                        Text("B15")
                            .foregroundColor(Color(red: 0.276, green: 0.311, blue: 0.416))
                                .padding(.horizontal, 12)
                                .padding(.vertical, 6)
                                .background(Color.yellow)
                                .cornerRadius(5)
                                .padding(8)
                                .fontWeight(.bold)
                        
                        Text("136 min")
                        
                    } // Cierre HStack - TBC
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("El Conjuro 4")
                        .font(.title2)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                    HStack {
                        
                        Text("Ver detalle")
                            .foregroundStyle(.blue)
                            .fontWeight(.bold)
                            .underline()
                        Image(systemName: "info.circle")
                            .foregroundStyle(.blue)
                        
                    } // Cierre HStack - Detalle
                    .padding(.top, 10)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                } // Cierre VStack - Peli 3
                .frame(width: frame)
                
            } // Cierre HStack

        } .padding(40) // Cierre Scroll View
        
    }
    
}

#Preview {
    ContentView()
}
