//
//  EspecialCard.swift
//  Tarea_05
//
//  Created by Lolretta on 21/10/25.
//

import SwiftUI

struct PointsLogo: View {
    var body: some View {
        
        VStack {
            ZStack{
                Circle()
                    .fill(Color.red)
                    .frame(width: 30, height: 30, alignment: .leading)
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
            }
        }

    }
}

#Preview {
    PointsLogo()
}
