//
//  PizzaPalaceApp.swift
//  PizzaPalace
//
//  Created by Philippe Blais on 2021-06-05.
//

import SwiftUI

@main
struct PizzaPalaceApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
          WindowGroup {
            Login().environment(\.managedObjectContext, persistenceController.container.viewContext)
          }
      }
}
