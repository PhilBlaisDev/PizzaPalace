//
//  ContentView.swift
//  PizzaPalace
//
//  Created by Philippe Blais on 2021-06-05.
//

import SwiftUI
import CoreData



struct MenuItem {
    var id: Int?
    var title: String = ""
}

struct QuickMenu: View {
    @Environment(\.managedObjectContext) private var viewContext
    let columns = Array(repeating: GridItem(.flexible(minimum: 60), spacing: 5, alignment: .top), count: 2)
    let array = [MenuItem(id: 0, title: "Create Customer account"), MenuItem(id: 1, title: "Place Order"), MenuItem(id: 2, title: "Make a payment"), MenuItem(id: 3, title: "Make a Reservation")]
    
    var body: some View {
        HStack(spacing:0){
            VStack(spacing: 0){
                Spacer()
                LazyVGrid(columns: columns, spacing: 5) {
                    ForEach(array, id: \.id) { menuItem in
                        Button(action: {
                            print("Button Tapped!")
                        }, label: {
                            Text(menuItem.title)
                                .frame(minWidth: 80, maxWidth: .infinity, minHeight: 80, maxHeight: .infinity)
                                .padding()
                        }).padding()
                    }
                }
                Spacer()
            }
        }.background(Color.white)
    }
}

struct QuickMenu_Previews: PreviewProvider {
    static var previews: some View {
        QuickMenu().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
