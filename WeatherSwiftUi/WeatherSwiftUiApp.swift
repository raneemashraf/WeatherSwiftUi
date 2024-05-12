//
//  WeatherSwiftUiApp.swift
//  WeatherSwiftUi
//
//  Created by raneem on 13/05/2024.
//

import SwiftUI

@main
struct WeatherSwiftUiApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
