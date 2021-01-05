//
//  PhonebankApp.swift
//  Shared
//
//  Created by Philip Tam on 2020-12-19.
//

import SwiftUI

@main
struct PhonebankApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
