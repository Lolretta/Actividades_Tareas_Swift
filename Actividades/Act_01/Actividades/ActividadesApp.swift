//
//  ActividadesApp.swift
//  Actividades
//
//  Created by win603 on 18/08/25.
//

import SwiftUI

@main
struct ActividadesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.locale, .init(identifier: "en")) //comentar esta línea cuando pase a producción
        }
    }
}
