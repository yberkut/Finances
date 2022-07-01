//
//  FinancesApp.swift
//  Finances
//
//  Created by Yaroslav Berkut on 29.06.2022.
//

import SwiftUI

@main
struct FinancesApp: App {
  var body: some Scene {
    WindowGroup {
      let viewContext = PersistenceController.shared.container.viewContext

      BanksView(vm: BanksViewModel(context: viewContext))
        .environment(\.managedObjectContext, viewContext)

    }
  }
}
