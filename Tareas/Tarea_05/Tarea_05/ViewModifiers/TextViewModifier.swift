//
//  TextViewModifier.swift
//  Tarea_05
//
//  Created by Lolretta on 22/10/25.
//

import SwiftUI

struct TextViewModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        
        content
            .font(.title2)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity, alignment: .leading)
        
    }
    
}
