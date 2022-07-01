//
//  Bank+Extensions.swift
//  Finances
//
//  Created by Yaroslav Berkut on 01.07.2022.
//

import CoreData
import Foundation

extension Bank: BaseModel {

  static var all: NSFetchRequest<Bank> {
    let request = Bank.fetchRequest()
    request.sortDescriptors = []
    return request
  }
  
}
