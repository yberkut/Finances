//
//  EditViewModel.swift
//  Finances
//
//  Created by Yaroslav Berkut on 29.06.2022.
//

import CoreData
import Foundation

struct EditViewModel {
  let context: NSManagedObjectContext
  let persistenceController: PersistenceController

  var account: Account
  var speaker: Speaker

  init(persistenceController: PersistenceController, speaker: Speaker? = nil) {
    self.context = persistenceController.childViewContext()
    if let speaker = speaker {
      self.speaker = persistenceController.copyForEditing(of: speaker, in: context)
    } else {
      self.speaker = persistenceController.newTemporaryInstance(in: context)
    }
  }

  func persist() {
    persistenceController.persist(speaker)

  }
}
