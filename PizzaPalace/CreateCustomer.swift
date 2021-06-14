//
//  ContentView.swift
//  PizzaPalace
//
//  Created by Philippe Blais on 2021-06-05.
//

import SwiftUI
import CoreData

struct CreateCustomer: View {
    @Binding var displayViewId: Int
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(sortDescriptors:[])
    var users: FetchedResults<User>
    
    @State var username: String = ""
    @State var password: String = ""

    
    var body: some View {
        VStack(spacing:0){
            HStack{
                VStack(spacing: 0){
                    Text("Create Customer Account").padding(20)
                    Divider()
                    
                    TextField("Username", text: $username).textFieldStyle(PlainTextFieldStyle()).padding(20).foregroundColor(.green)
                    TextField("Password", text: $password).textFieldStyle(PlainTextFieldStyle()).padding(20).foregroundColor(.green)

                   
                  
                    
                    
                    Text("Language").padding(20)
                    Divider()
                    
                    Text("Dropdown").padding(20)
                    Spacer()
                }
            
                VStack(spacing: 0){
                    
                    Text("Date of birth").padding(20)
                    Divider()
                    
                    Text("Home Address").padding(20)
                    Divider()
                    
                    
                    HStack(alignment: .center, spacing: 50) {
                        Spacer()
                        TextField("Username", text: $username).textFieldStyle(PlainTextFieldStyle()).padding(20).foregroundColor(.green)
                    }
                    Spacer()
                    HStack(spacing:20){
                        Button(action: {
                            self.displayViewId = 1
                        }, label: {
                            Text("Cancel")
                        }).buttonStyle(BlackButtonStyle())
                        
                        Button(action: {
                            addUser(username: username, password: password)
                        }, label: {
                            Text("Create")
                        }).buttonStyle(BlackButtonStyle())
                    }
                    
                }
            }
            Spacer()
        }.background(Color.white)
        .navigationTitle("")
        .toolbar {
            ToolbarItem(placement: .navigation) {
                        Button(action: {
                            self.displayViewId = 1
                        }) {
                            Label("Back", systemImage: "chevron.left")
                        }.buttonStyle(PlainButtonStyle()).padding(.horizontal, 20)
           }

            ToolbarItem(placement: .primaryAction) {
                    Button(action: {
                        self.displayViewId = 1
                    }) {
                        Label("Back 3", systemImage: "magnifyingglass")
                    }.buttonStyle(PlainButtonStyle()).padding(.horizontal, 20)
            }
            ToolbarItem(placement: .primaryAction) {
                    Button(action: {
                        self.displayViewId = 0
                    }) {
                        Label("Back 3", systemImage: "escape")
                    }.buttonStyle(PlainButtonStyle()).padding(.horizontal, 20)
            }
        }
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
