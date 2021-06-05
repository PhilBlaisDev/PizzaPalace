//
//  ContentView.swift
//  PizzaPalace
//
//  Created by Philippe Blais on 2021-06-05.
//

import SwiftUI
import CoreData

struct User {
    var username = "Me"
}

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State var user: User = User(username: "Test User")

    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            HStack (spacing: 50){
                Spacer()
                TextField("Username", text: $user.username)
                Button(action: {
                    print("Button tapped")
                }) {
                    Text("Save")
                }
                Spacer()
            }

            Spacer()
                                        
            Text("Some content").foregroundColor(.red)
            Spacer()
        }
    }

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
