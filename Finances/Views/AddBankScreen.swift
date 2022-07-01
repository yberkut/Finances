//
//  AddBankScreen.swift
//  Finances
//
//  Created by Yaroslav Berkut on 01.07.2022.
//

import SwiftUI

struct AddBankScreen: View {

  @Environment(\.presentationMode) var presentationMode
  @ObservedObject var vm: AddBankViewModel

  init(vm: AddBankViewModel) {
    self.vm = vm
  }

  var body: some View {
    Form {
      TextField("Введіть назву", text: $vm.name)

      Button("Зберегти") {
        vm.save()
        presentationMode.wrappedValue.dismiss()
      }
      .centerHorizontally()

      .navigationTitle("Новий банк")
    }
  }
}

struct AddBankScreen_Previews: PreviewProvider {
  static var previews: some View {
    let viewContext = PersistenceController.shared.container.viewContext
    NavigationView {
      AddBankScreen(vm: AddBankViewModel(context: viewContext))
    }
  }
}
