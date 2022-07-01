//
//  BaseModel.swift
//  Finances
//
//  Created by Yaroslav Berkut on 01.07.2022.
//

import CoreData
import Foundation

protocol BaseModel {
  static var viewContext: NSManagedObjectContext { get }
  func save() throws
  func delete() throws
}

extension BaseModel where Self: NSManagedObject {

  static var viewContext: NSManagedObjectContext {
    PersistenceController.shared.container.viewContext
  }

  func save() throws {
    try Self.viewContext.save()
  }

  func delete() throws {
    Self.viewContext.delete(self)
    try save()
  }

}
