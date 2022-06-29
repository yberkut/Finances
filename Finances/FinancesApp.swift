//
//  FinancesApp.swift
//  Finances
//
//  Created by Yaroslav Berkut on 29.06.2022.
//

import SwiftUI

@main
struct FinancesApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
