//
//  ContentView.swift
//  Actividades
//
//  Created by win603 on 18/08/25.
//

import SwiftUI

struct ContentView: View {
    
    let introduccion: String =
        String(localized: "introduction")
    let historia: String =
        String(localized: "story")
    
    ///
    var body: some View {
        VStack {
            Text(introduccion)
                .font(.custom("Starjedi", size: 25))
                .multilineTextAlignment(.center)
            Text(historia)
                .font(.custom("Starjedi", size: 15))
                .frame(width: .infinity, height: .infinity).rotation3DEffect(
                    .degrees(Double(45)),axis: (x: 0.5, y: 0.0, z: 0.0))
        }
        .frame(maxWidth: .infinity, maxHeight:.infinity)
        .foregroundColor(.yellow)
        .background(.black)
    }
    ///
    
}

#Preview {
    ContentView()
}
