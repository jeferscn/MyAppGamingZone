//
//  MyAppGamingZoneApp.swift
//  MyAppGamingZone
//
//  Created by Jeferson Pereira on 30/09/23.
//

import SwiftUI

@main
struct MyAppGamingZoneApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            LoginScreenView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
