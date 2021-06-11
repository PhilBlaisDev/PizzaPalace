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
    @Environment(\.presentationMode) var presentationMode
    @State private var showingSheet = false

    let columns = Array(repeating: GridItem(.flexible(minimum: 60), spacing: 5, alignment: .top), count: 2)
    let array = [MenuItem(id: 0, title: "Create Customer account"), MenuItem(id: 1, title: "Place Order"), MenuItem(id: 2, title: "Make a payment"), MenuItem(id: 3, title: "Make a Reservation")]
    
    var body: some View {
        HStack(spacing:0){
            VStack(spacing: 0){
                LazyVGrid(columns: columns, spacing: 5) {
                    ForEach(array, id: \.id) { menuItem in
                        Button(action: {
                            showingSheet.toggle()
                        }, label: {
                            Text(menuItem.title)
                                .frame(minWidth: 200, maxWidth: 200, minHeight: 200, maxHeight: 200)
                                .padding()
                                .font(.system(size: 24))
                                .multilineTextAlignment(.center)
                        }).padding().buttonStyle(SquareButtonStyle())
                        .sheet(isPresented: $showingSheet) {
                                    SheetView()
                                }
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



struct SquareButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(12)
            
            // Indigo background color on release, yellow on press.
            .background(!configuration.isPressed ?
                            Color.init(red: 0/255, green: 0/255, blue: 0/255, opacity: 0.4):
                            Color.init(red: 0/255, green: 0/255, blue: 255/255, opacity: 0.4)
                            )
            
            // White text color on release, black on press.
            .foregroundColor(!configuration.isPressed ? .white : .black)
            .cornerRadius(8)
    }
}
