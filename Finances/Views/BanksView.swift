//
//  ContentView.swift
//  Finances
//
//  Created by Yaroslav Berkut on 29.06.2022.
//

import CoreData
import SwiftUI

struct BanksView: View {

  @State private var isPresented = false
  @Environment(\.managedObjectContext) private var viewContext
  @ObservedObject private var banksVM: BanksViewModel

  init(vm: BanksViewModel) {
    self.banksVM = vm
  }

  private func deleteBank(at offsets: IndexSet) {
    offsets.forEach { index in
      let bank = banksVM.banks[index]
      banksVM.deleteBank(bankId: bank.id)
    }
  }

  var body: some View {
    NavigationView {
      VStack {
        List {
          ForEach(banksVM.banks) { bank in
            Text(bank.name)
          }.onDelete(perform: deleteBank)
        }
      }
      .sheet(
        isPresented: $isPresented,
        onDismiss: {
          // dismiss
        },
        content: {
          AddBankScreen(vm: AddBankViewModel(context: viewContext))
        }
      )
      .navigationTitle("Банки")
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button("Додати новий банк") {
            isPresented = true
          }
        }
      }
    }
  }

}

extension PersistenceController {

  static var storeForBanksPreview: PersistenceController = {
    let result = PersistenceController(inMemory: true)
    let viewContext = result.container.viewContext
    for i in 0..<10 {
      let bank = Bank(context: viewContext)
      bank.name = "Мій Банк \(i)"
    }
    try! viewContext.save()

    return result
  }()

}

struct BanksView_Previews: PreviewProvider {
  static var previews: some View {
    let viewContext = PersistenceController.storeForBanksPreview.container.viewContext
    BanksView(vm: BanksViewModel(context: viewContext))
      .environment(\.managedObjectContext, viewContext)
  }
}
