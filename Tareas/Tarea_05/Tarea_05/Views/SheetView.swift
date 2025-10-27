//
//  SheetView.swift
//  Tarea_05
//
//  Created by Lolretta on 24/10/25.
//

import SwiftUI

struct SheetView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var saldo: Double
    @State private var cantidad: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            
            // Indicador superior (barra gris)
            Capsule()
                .fill(Color.gray.opacity(0.4))
                .frame(width: 40, height: 5)
                .padding(.top, 10)
            
            // Título
            Text("Añadir saldo")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.top, 10)
            
            // Campo de texto numérico
            VStack(alignment: .leading, spacing: 6) {
                Text("Saldo a añadir")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                TextField("0.00", text: $cantidad)
                    .keyboardType(.decimalPad)
                    .padding()
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            
            // Botón cancelar
            Button(action: {
                dismiss()
            }) {
                Text("Cancelar")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            
            // Botón confirmar
            Button(action: {
                if let monto = Double(cantidad) {
                    saldo += monto
                }
                dismiss()
            }) {
                Text("Confirmar")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(cantidad.isEmpty ? Color.gray : Color.blue)
                    .cornerRadius(10)
            }
            .disabled(cantidad.isEmpty)
            .padding(.horizontal)
            
            Spacer()
        }
        .presentationDetents([.medium])
    }
}

#Preview {
    SheetView(saldo: .constant(599.99))
}

