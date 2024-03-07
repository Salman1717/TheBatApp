//
//  TheBatAppApp.swift
//  TheBatApp
//
//  Created by Salman Mhaskar on 07/03/24.
//

import SwiftUI

@main
struct TheBatAppApp: App {

    var body: some Scene {
        WindowGroup {
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            CriminalList()
        }
    }
}
