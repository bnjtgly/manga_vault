//
//  manga_vaultApp.swift
//  manga_vault
//
//  Created by Benjie Tigley on 9/17/24.
//

import SwiftUI

@main
struct manga_vaultApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
