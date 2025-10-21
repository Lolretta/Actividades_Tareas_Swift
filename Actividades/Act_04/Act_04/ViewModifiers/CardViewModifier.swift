//
//  CardViewModifier.swift
//  Act_04
//
//  Created by Lolretta on 18/10/25.
//

import Foundation

import SwiftUI

struct CardViewModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        
        content
            .padding(.trailing)
            .cornerRadius(15)
            .padding(4)
        
    }
    
}
