//
//  ContentView.swift
//  Act_03
//
//  Created by Lolretta on 10/09/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var ruta = "pacifist"
    @State var enemy = "toriel"
    @State var accion = "MERCY"
    @State var easy = true
    @State var medium = false
    @State var hard = false
    
    @State var state: CGFloat = 1
    
    var body: some View {
        
        ZStack {
            
            Image(ruta)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
                
                Image(enemy)
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(state)
                    .frame(width: 210, height: 210)

                    
                Button(action: {
                                    
                    withAnimation() {
                        
                        if (ruta == "pacifist") {
                            if state == 1.4 {
                                state = 1
                            }
                            else {
                                state += 0.2
                            }
                        } else if (ruta == "genocide") {
                            if state == 0.5 {
                                state = 1
                            }
                            else {
                                state -= 0.5
                            }

                        }
                        
                    }
                }) {
                    Text(accion).font(.custom("MonsterFriendFore", size: 19))
                }
                .padding()
                .frame(width: 150)
                .background(Color.blue)
                .cornerRadius(10)
                .foregroundColor(.white)
                
                Spacer()
                
                VStack (spacing: 20) {
                    
                    HStack (spacing: 20){
                        
                        if easy {
                            Image("heart")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                        }
                        
                        Button(action: {
                            withAnimation() {
                                
                                easy = true
                                medium = false
                                hard = false
                                
                                if (ruta == "pacifist") {
                                    enemy = "toriel"
                                } else {
                                    enemy = "met"
                                }
                                
                            }
                        }) {
                            Text("Easy").font(.custom("MonsterFriendFore", size: 24))
                        }
                        .padding()
                        .frame(width: 175)
                        .background(Color.green)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        
                    }
                    
                    HStack (spacing: 20) {
                        
                        if medium {
                            Image("heart")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                        }
                        
                        Button(action: {
                            withAnimation() {
                                
                                easy = false
                                medium = true
                                hard = false
                                
                                if (ruta == "pacifist") {
                                    enemy = "undyne_pac"
                                } else {
                                    enemy = "undyne_gen"
                                }
                                
                            }
                        }) {
                            Text("Medium").font(.custom("MonsterFriendFore", size: 24))
                        }
                        .padding()
                        .frame(width: 175)
                        .background(Color.yellow)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        
                    }
                    
                    HStack (spacing: 20) {
                        
                        if hard {
                            Image("heart")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                        }
                        
                        Button(action: {
                            withAnimation() {
                                
                                easy = false
                                medium = false
                                hard = true
                                
                                if (ruta == "pacifist") {
                                    enemy = "papyrus"
                                } else {
                                    enemy = "sans"
                                }
                                
                            }
                        }) {
                            Text("Hard").font(.custom("MonsterFriendFore", size: 24))
                        }
                        .padding()
                        .frame(width: 175)
                        .background(Color.red)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        
                    }
                    
                }
                
                Spacer()
                
                HStack (spacing: 20) {
                    
                    Button(action: {
                        ruta = "pacifist"
                        easy = true
                        medium = false
                        hard = false
                        enemy = "toriel"
                        accion = "MERCY"
                        state = 1
                    }) {
                        Text("♥️ PACIFIST").font(.custom("PixelOperatorMono", size: 24))
                    }
                    .padding()
                    .frame(width: 175)
                    .background(Color.green)
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    
                    Button(action: {
                        ruta = "genocide"
                        easy = true
                        medium = false
                        hard = false
                        enemy = "met"
                        accion = "ATTACK"
                        state = 1
                    }) {
                        Text("🔪 GENOCIDE").font(.custom("PixelOperatorMono", size: 24))
                    }
                    .padding()
                    .frame(width: 175)
                    .background(Color.red)
                    .cornerRadius(10)
                    .foregroundColor(.white)
                }
                 
            }
            .padding(.top, 60)
            .padding(.bottom, 90)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            
            
        }
        
    }
}

#Preview {
    ContentView()
}
