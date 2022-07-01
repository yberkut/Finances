//
//  View+Extensions.swift
//  Finances
//
//  Created by Yaroslav Berkut on 01.07.2022.
//

import Foundation
import SwiftUI

extension View {
  func centerHorizontally() -> some View {
    HStack {
      Spacer()
      self
      Spacer()
    }
  }
}
