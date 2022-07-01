//
//  BanksViewModel.swift
//  Finances
//
//  Created by Yaroslav Berkut on 01.07.2022.
//

import CoreData
import Foundation

@MainActor
class BanksViewModel: NSObject, ObservableObject {

  @Published var banks = [BankViewModel]()
  private let fetchedResultsController: NSFetchedResultsController<Bank>
  private(set) var context: NSManagedObjectContext

  init(context: NSManagedObjectContext) {
    self.context = context

    fetchedResultsController = NSFetchedResultsController(
      fetchRequest: Bank.all, managedObjectContext: context,
      sectionNameKeyPath: nil, cacheName: nil)
    super.init()
    fetchedResultsController.delegate = self

    do {
      try fetchedResultsController.performFetch()

      guard let banks = fetchedResultsController.fetchedObjects else {
        return
      }

      self.banks = banks.map(BankViewModel.init)
    } catch {
      print(error)
    }
  }

  func deleteBank(bankId: NSManagedObjectID) {
    
    do {
      guard let bank = try context.existingObject(with: bankId) as? Bank else {
        return
      }

      try bank.delete()
    } catch {
      print(error)
    }
  }

}

extension BanksViewModel: NSFetchedResultsControllerDelegate {

  func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {

    guard let banks = controller.fetchedObjects as? [Bank] else {
      return
    }

    self.banks = banks.map(BankViewModel.init)
  }

}

struct BankViewModel: Identifiable {

  private var bank: Bank

  init(bank: Bank) {
    self.bank = bank
  }

  var id: NSManagedObjectID {
    bank.objectID
  }

  var name: String {
    bank.name ?? ""
  }

}
