//
//  ContentView.swift
//  PizzaPalace
//
//  Created by Philippe Blais on 2021-06-05.
//

import SwiftUI
import CoreData

struct Customers: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(sortDescriptors:[])
    var users: FetchedResults<User>
    
    @State var username: String = ""
    @State var password: String = ""

    
    var body: some View {
        HStack(spacing:0){
            VStack(spacing: 0){
                List{
                    ForEach(users){ user in
                        HStack (spacing: 20){
                            Text("First Name: ")
                            Text(user.firstName ?? "")
                            Text(user.lastName ?? "")
                            Text(user.email ?? "")
                            Text(user.phone ?? "")
                        }.padding(10)

                        
                    }.onDelete(perform: deleteUsers)
                    
                }
            }
        }.background(Color.white)
    }
    
    private func deleteUsers(offsets: IndexSet){
        withAnimation{
            offsets.map{users[$0]}.forEach(viewContext.delete)
            saveContext()
        }
    }
    
    private func addUser(username: String, password: String){
        let newUser = User(context: viewContext)
        newUser.username = username
        newUser.password = password
        saveContext()
    }
    
    private func saveContext(){
        do {
            try viewContext.save()
        } catch {
            let error = error as NSError
            fatalError("Unresolved Error: \(error)")
        }
    }
}

struct Customers_Previews: PreviewProvider {
    static var previews: some View {
        Customers().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
