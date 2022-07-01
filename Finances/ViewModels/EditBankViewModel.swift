//
//  EditBankViewModel.swift
//  Finances
//
//  Created by Yaroslav Berkut on 01.07.2022.
//

import CoreData
import Foundation

struct EditBankViewModel {
  let context: NSManagedObjectContext
  let persistenceController: PersistenceController

  var bank: Bank

  init(persistenceController: PersistenceController, bank: Bank? = nil) {
    self.persistenceController = persistenceController
    self.context = persistenceController.childViewContext()
    if let bank = bank {
      self.bank = persistenceController.copyForEditing(of: bank, in: context)
    } else {
      self.bank = persistenceController.newTemporaryInstance(in: context)
    }
  }

  func persist() {
    persistenceController.persist(bank)
  }
}
