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
	@StateObject var manager = MusicManager()

    var body: some Scene {
        WindowGroup {
            ContentView(manager: manager)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
