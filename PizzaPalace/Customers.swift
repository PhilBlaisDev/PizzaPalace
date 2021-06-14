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
    @State var text: String = ""
    @State private var isEditing = false
    let filterArray = ["First Name", "Last name", "Phone Number", "Email", "Loyalty"]


    var body: some View {
        HStack(spacing:0){
            VStack(alignment: .leading, spacing: 0){

                HStack(spacing:0){
                    Text("Filter by:").padding()
                    Menu {
                        ForEach(filterArray, id: \.self) { item in
                            Button(action: {

                            }) {
                                Text(item)
                            }
                        }
                    } label: {
                        Text("").padding(10)
                    }.frame(width:100, alignment: .leading)
                    Spacer()
                    SearchBar(text: $text).frame(width:200)

                }.background(Color.init(red: 0/255, green: 0/255, blue: 0/255, opacity: 0.1))


                HStack (spacing: 0){
                    Text("First Name").bold().frame(width:100, alignment: .leading)
                    Text("Last Name").bold().frame(width:100, alignment: .leading)
                    Text("Email").bold().frame(width:160, alignment: .leading)
                    Text("Phone").bold().frame(width:160, alignment: .leading)
                    Text("Street").bold().frame(width:100, alignment: .leading)
                    Text("Loyalty").bold().frame(width:100, alignment: .leading)
                    Text("Note").bold().frame(width:200, alignment: .leading)
                }.padding()
                Divider()
                List{
                    ForEach(users){ user in
                        VStack(alignment: .leading){
                            HStack (spacing: 0){
                                Text(user.firstName ?? "").frame(width:100, alignment: .leading)
                                Text(user.lastName ?? "").frame(width:100, alignment: .leading)
                                Text(user.email ?? "").frame(width:160, alignment: .leading)
                                Text(user.phone ?? "").frame(width:160, alignment: .leading)
                                Text(user.street ?? "").frame(width:100, alignment: .leading)
                                Text(user.isLoyaltyMember ? "YES" : "NO").frame(width:100, alignment: .leading)
                                Text(user.note ?? "").frame(width:200, alignment: .leading)
                            }.padding(.vertical, 10)
                            Divider()
                        }
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

    private func saveContext(){
        do {
            try viewContext.save()
        } catch {
            let error = error as NSError
            fatalError("Unresolved Error: \(error)")
        }
    }
}


struct SearchBar: View {
    @Binding var text: String

    @State private var isEditing = false

    var body: some View {
        HStack {

            TextField("Search ...", text: $text)
                    .textFieldStyle(PlainTextFieldStyle())
                    .padding(7)
                    .padding(.horizontal, 25)
                    .background(Color.white)
                    .cornerRadius(8)
                    .overlay(
                        HStack {
                            Image(systemName: "magnifyingglass")
                                    .foregroundColor(.gray)
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading, 8)

                            if isEditing {
                                Button(action: {
                                    self.text = ""
                                }) {
                                    Image(systemName: "multiply.circle.fill")
                                            .foregroundColor(.gray)
                                            .padding(.trailing, 8)
                                }
                            }
                        }
                    )
                    .padding(.horizontal, 10)
                    .onTapGesture {
                        self.isEditing = true
                    }

            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.text = ""

                }) {
                    Text("Cancel")
                }
                        .padding(.trailing, 10)
                        .transition(.move(edge: .trailing))
                        .animation(.default)
            }
        }
    }
}
