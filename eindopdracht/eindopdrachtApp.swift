//
//  eindopdrachtApp.swift
//  eindopdracht
//
//  Created by Tommy den Reijer on 16/02/2022.
//

import SwiftUI

@main
struct eindopdrachtApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
