//
//  ContentView.swift
//  Tarea_02
//
//  Created by Lolretta on 10/09/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
           
            VStack (spacing: 0) {
                Rectangle()
                    .fill(Color(red: 1.0, green: 0.804, blue: -0.001))
                    .frame(width: 300, height: 80)
                Rectangle()
                    .fill(Color(red: -0.001, green: 0.188, blue: 0.53))
                    .frame(width: 300, height: 40)
                Rectangle()
                    .fill(Color(red: 0.783, green: 0.063, blue: 0.182))
                    .frame(width: 300, height: 40)
            }
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .frame(width: .infinity, height: .infinity)
            
            ZStack {
                Circle()
                    .fill(Color(red: 0.006, green: 0.442, blue: 0.864))
                    .frame(width: 200, height: 200)
                Circle()
                    .fill(Color(red: 0.069, green: 0.717, blue: 0.387))
                    .frame(width: 100, height: 100)
                Circle()
                    .fill(Color(red: 0.93, green: 0.754, blue: 0.259))
                    .frame(width: 50, height: 50)
                Circle()
                    .fill(Color(red: 0.95, green: 0.187, blue: 0.228))
                    .frame(width: 25, height: 25)
            }
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .frame(width: .infinity, height: .infinity)
            
            ZStack {
                Circle()
                    .fill(Color(red: 0.088, green: 0.776, blue: 0.41))
                    .frame(width: 175, height: 175)
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 50, height: 50)
            }
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .frame(width: .infinity, height: .infinity)
                
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
