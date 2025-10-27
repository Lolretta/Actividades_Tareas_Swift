//
//  TransportLogo.swift
//  Tarea_05
//
//  Created by Lolretta on 22/10/25.
//

import SwiftUI

struct TransportLogo: View {
    var body: some View {
        
        VStack {
            ZStack{
                Circle()
                    .fill(Color.green)
                    .frame(width: 30, height: 30, alignment: .leading)
                Image(systemName: "bus.fill")
                    .foregroundStyle(.white)
            }
        }
        
    }
}

#Preview {
    TransportLogo()
}
