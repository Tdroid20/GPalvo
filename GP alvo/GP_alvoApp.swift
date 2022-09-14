//
//  GP_alvoApp.swift
//  GP alvo
//
//  Created by user226765 on 9/8/22.
//

import SwiftUI

@main
struct GP_alvoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
