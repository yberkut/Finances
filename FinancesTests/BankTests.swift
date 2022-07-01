//
//  BankTests.swift
//  FinancesTests
//
//  Created by Yaroslav Berkut on 30.06.2022.
//

import CoreData
import XCTest

@testable import Finances

class BankTests: XCTestCase {

  var context: NSManagedObjectContext!

  override func setUp() {
    context = PersistenceController.empty().container.viewContext
    super.setUp()
  }

  override func tearDown() {
    super.tearDown()
    context = nil
  }

  func test_Add_Bank() {
    let bank = Bank(context: context)

    XCTAssertNotNil(bank.name_, "should have name")
  }

  func test_fetch() {
    _ = Bank(context: context)

    let request = Bank.fetch()
    let banks = try? context.fetch(request)

    XCTAssertTrue(banks?.count ?? 0 > 0, "bank was not fetched")
  }
}
