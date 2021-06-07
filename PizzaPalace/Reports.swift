//
//  ContentView.swift
//  PizzaPalace
//
//  Created by Philippe Blais on 2021-06-05.
//

import SwiftUI
import CoreData

struct Reports: View {
    @Environment(\.managedObjectContext) private var viewContext

    var body: some View {
        HStack(spacing:0){
            VStack(spacing: 0){
                Spacer()
                Text("Reports")
                Spacer()
            }
        }.background(Color.white)
    }
}

struct Reports_Previews: PreviewProvider {
    static var previews: some View {
        Reports().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
