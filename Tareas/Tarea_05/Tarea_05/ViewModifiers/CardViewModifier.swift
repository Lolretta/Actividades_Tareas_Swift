//
//  CardViewModel.swift
//  Tarea_05
//
//  Created by Lolretta on 22/10/25.
//

import SwiftUI

struct CardViewModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        
        content
            .cornerRadius(15)
            .padding(4)
        
    }
    
}
