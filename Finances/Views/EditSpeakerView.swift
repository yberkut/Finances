//
//  EditSpeakerView.swift
//  Finances
//
//  Created by Yaroslav Berkut on 29.06.2022.
//

import SwiftUI

struct EditSpeakerView: View {
  @State var viewModel: EditViewModel

  var body: some View {

    NavigationView {
      VStack {
        TextField("Speaker name", text: $viewModel.speaker.name)
          .textFieldStyle(RoundedBorderTextFieldStyle())
        Spacer()
      }
      .navigationTitle(Text("Edit speaker"))
      .navigationBarItems(leading: Button("Cancel") {
        // dismiss
      }, trailing: Button("Save") {
        viewModel.persist()
      })
    }
  }
}

extension PersistenceController {
  static var storeForEditPreview: PersistenceController {
    let result = PersistenceController(inMemory: true)
    let viewContext = result.container.viewContext

    for i in 0..<10 {
      let item = Speaker(context: viewContext)
      item.name = "Speaker \(i)"
    }
    try! viewContext.save()

    return result
  }
}

struct EditSpeakerView_Previews: PreviewProvider {
  static var previews: some View {
    EditSpeakerView(viewModel: EditViewModel(persistenceController: PersistenceController.storeForEditPreview))
      .environment(\.managedObjectContext, PersistenceController.storeForEditPreview.container.viewContext)
  }
}
