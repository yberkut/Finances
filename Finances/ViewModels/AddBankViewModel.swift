//
//  AddBankViewModel.swift
//  Finances
//
//  Created by Yaroslav Berkut on 01.07.2022.
//

import CoreData
import Foundation

class AddBankViewModel: ObservableObject {

  @Published var name: String = ""

  var context: NSManagedObjectContext

  init(context: NSManagedObjectContext) {
    self.context = context
  }

  func save() {

    do {
      let bank = Bank(context: context)
      bank.name = name
      try bank.save()
    } catch {
      print(error)
    }
  }

}
