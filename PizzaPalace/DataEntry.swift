//
//  ContentView.swift
//  PizzaPalace
//
//  Created by Philippe Blais on 2021-06-05.
//

import SwiftUI
import CoreData

struct DataEntry: View {
    @Environment(\.managedObjectContext) private var viewContext

    var body: some View {
        VStack(){
            Text("Data Entry")
        }.background(Color.white)
    }
}

struct DataEntry_Previews: PreviewProvider {
    static var previews: some View {
        DataEntry().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
