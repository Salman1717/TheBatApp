//
//  TheBatAppApp.swift
//  TheBatApp
//
//  Created by Salman Mhaskar on 07/03/24.
//

import SwiftUI

@main
struct TheBatAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
