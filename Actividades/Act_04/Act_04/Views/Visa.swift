//
//  Visa.swift
//  Act_04
//
//  Created by Lolretta on 06/10/25.
//

import SwiftUI

struct Visa: View {
    var body: some View {
        
        VStack {
            ZStack{
                Circle()
                    .fill(Color.black)
                    .frame(width: 30, height: 30, alignment: .leading)
                Text("VISA")
                    .font(.caption2)
                    .foregroundStyle(.white)
            }
        }
        
    }
}

#Preview {
    Visa()
}
