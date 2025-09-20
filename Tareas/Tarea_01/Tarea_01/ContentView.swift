//
//  ContentView.swift
//  Tarea_01
//
//  Created by win603 on 22/08/25.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        ZStack {
            
            VStack {
                
                HStack { // Primera fila
                    Text("Amarillo").foregroundColor(.green)
                    Text("Azul").foregroundColor(.red)
                    Text("Naranja").foregroundColor(.blue)
                }
                .padding(10)
                .frame(maxWidth: .infinity, alignment: .center)
                
                HStack { // Segunda fila
                    Text("NEGRO")
                        .foregroundColor(.black)
                        .frame(width: 100.0, height: 50.0)
                        .background(Color(hue: 0.78, saturation: 0.389, brightness: 0.974))
                        .frame(maxWidth:.infinity)
                    Text("ROJO")
                        .foregroundColor(.red)
                        .frame(width: 70.0)
                        .background(Color(red: 0.498, green: 0.74, blue: 0.998))
                        .cornerRadius(100)
                        .frame(maxWidth:.infinity)
                }
                .frame(maxWidth: .infinity, alignment: .center)
                
                HStack { // Tercera fila
                    Text("Verde")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(height: 60.0)
                        .frame(maxWidth:.infinity)
                        .background(Color(red: 0.998, green: 0.584, blue: 0.012))
                }
                .padding(.vertical, 5.0)
                .frame(maxWidth: .infinity, alignment: .center)
                
                HStack { // Cuarta fila
                    Text("Morado")
                        .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                        .padding(/*@START_MENU_TOKEN@*/[.leading, .bottom, .trailing]/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.black)
                        .frame(width: 125.0)
                        .background(LinearGradient(gradient: Gradient(colors: [.orange, .green, .orange]), startPoint: .leading, endPoint: .trailing))
                        .border(Color.purple, width: 2)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack { // Quinta fila
                    Text("Verde")
                        .foregroundColor(.white)
                        .frame(height: 60.0)
                        .background(Color(red: 0.998, green: 0.584, blue: 0.012))
                        .frame(maxWidth:.infinity)
                }

                .frame(maxWidth: .infinity, alignment: .center)
                
                
                
            }
            
            .frame(maxHeight:.infinity, alignment: .topLeading)
            .background(.white)
            
        }
        
        .padding()
        .frame(maxWidth: .infinity, maxHeight:.infinity)
        .background(.black)
        
    }
    
    
}

#Preview {
    ContentView()
}
