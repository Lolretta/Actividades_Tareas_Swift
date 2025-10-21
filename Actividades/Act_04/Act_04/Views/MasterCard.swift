//
//  MasterCard.swift
//  Act_04
//
//  Created by Lolretta on 06/10/25.
//

import SwiftUI

struct MasterCard: View {
    var body: some View {
        
        VStack {
            
            HStack (spacing: -10){
                
                Circle()
                    .fill(Color.blue)
                    .frame(width: 20, height: 20, alignment: .leading)
                
                Circle()
                    .fill(Color.orange)
                    .frame(width: 20, height: 20, alignment: .trailing)
            }
            
            Text("Mastercard")
                .font(.caption2)
                .foregroundStyle(.white)
            
        }

    }
}

#Preview {
    MasterCard()
}
