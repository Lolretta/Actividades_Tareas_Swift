//
//  TextViewModifier.swift
//  Act_04
//
//  Created by Lolretta on 08/10/25.
//

import SwiftUI

struct TextViewModifier: ViewModifier {
    
    var tamanio: Font = .callout
    func body(content: Content) -> some View {
        
        content
            .font(tamanio)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 5)
        
    }
    
}
