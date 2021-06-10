//
//  ContentView.swift
//  PizzaPalace
//
//  Created by Philippe Blais on 2021-06-05.
//

import SwiftUI
import CoreData

struct Setup: View {
    @Environment(\.managedObjectContext) private var viewContext

    var body: some View {
        HStack(spacing:0){
            VStack(spacing: 0){
                Spacer()
                Text("Setup")
                Spacer()
            }
        }.background(Color.white)
    }
}

struct Setup_Previews: PreviewProvider {
    static var previews: some View {
        Setup().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
