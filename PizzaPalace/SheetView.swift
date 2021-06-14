//
//  SheetView.swift
//  PizzaPalace
//
//  Created by Philippe Blais on 2021-06-10.
//

import SwiftUI

struct SheetView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors:[])
    var users: FetchedResults<User>
    @State var username: String = ""
    @State var password: String = ""
    @State var date: Date = Date()
    @State var user = UserObject()
    let languageArray = ["English", "French"]

    var body: some View {
        VStack(alignment: .leading){
            Text("Create Customer Account").padding(20).font(.largeTitle)
            Divider()
            HStack{
                leftSide()
                rightSide()
            }
        }
        .frame(width:1200, height: 800, alignment: .top)
        .padding()
    }
    
    
    fileprivate func leftSide() -> some View {
        return VStack(alignment: .leading){
            Text("Details")
                .padding(.horizontal, 20)
                .padding(.top, 20)
                .padding(.bottom, 0)
                .font(.largeTitle)
            Divider()
                .padding(.horizontal, 20)
            
            HStack(spacing: 10) {
                Spacer()
                VStack{
                    TextField("First Name", text: $user.firstName).textFieldStyle(PlainTextFieldStyle()).padding(10)
                    TextField("Last Name", text: $user.lastName).textFieldStyle(PlainTextFieldStyle()).padding(10)
                    TextField("Email", text: $user.email).textFieldStyle(PlainTextFieldStyle()).padding(10)
                    TextField("Password", text: $user.password).textFieldStyle(PlainTextFieldStyle()).padding(10)
                    TextField("Phone Number", text: $user.phone).textFieldStyle(PlainTextFieldStyle()).padding(10)
                }
            }
            
            Text("Language")
                .padding(.horizontal, 20)
                .padding(.top, 20)
                .padding(.bottom, 0)
                .font(.largeTitle)
            Divider().padding(.horizontal, 20)
            
            Menu {
                ForEach(languageArray, id: \.self) { item in
                    Button(action: {  }) {
                        Text(item)
                    }
                }
            } label: {
                Text("English").padding(10)
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 30)
            
            
            Text("Notes")
                .padding(.horizontal, 20)
                .padding(.top, 20)
                .padding(.bottom, 0)
                .font(.largeTitle)
            Divider().padding(.horizontal, 20)
            
            TextField("Notes", text: $username)
                .textFieldStyle(PlainTextFieldStyle())
                .padding(.vertical, 20)
                .padding(.horizontal, 40)

            Spacer()

        }
    }
    
    fileprivate func rightSide() -> some View {
        return VStack(alignment: .leading){
            Text("Date of birth")
                .padding(.horizontal, 20)
                .padding(.top, 20)
                .padding(.bottom, 0)
                .font(.largeTitle)
            Divider().padding(.horizontal, 20)
            
            VStack {
                DatePicker("Date", selection: $date, displayedComponents: [.date])
                                .datePickerStyle(CompactDatePickerStyle())
            }.padding()
            
            
            Text("Home Address")
                .padding(.horizontal, 20)
                .padding(.top, 20)
                .padding(.bottom, 0)
                .font(.largeTitle)
            Divider().padding(.horizontal, 20)
            
            
            HStack(spacing: 10) {
                Spacer()
                VStack{
                    TextField("House Number", text: $user.number).textFieldStyle(PlainTextFieldStyle()).padding(10)
                    TextField("Street", text: $user.street).textFieldStyle(PlainTextFieldStyle()).padding(10)
                    TextField("City", text: $user.city).textFieldStyle(PlainTextFieldStyle()).padding(10)
                    TextField("Postal Code", text: $user.postalCode).textFieldStyle(PlainTextFieldStyle()).padding(10)
                    TextField("Country", text: $user.country).textFieldStyle(PlainTextFieldStyle()).padding(10)
                }
                
            }
            Spacer()
            
            HStack(spacing: 20){
                Spacer()
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("Cancel")
                    }).buttonStyle(BlackButtonStyle())
                    
                    Button(action: {
                        addUser(user: user)
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("Create")
                    }).buttonStyle(BlackButtonStyle())
             
            }
            
        }
    }
    
    private func deleteUsers(offsets: IndexSet){
        withAnimation{
            offsets.map{users[$0]}.forEach(viewContext.delete)
            
            saveContext()
        }
    }
    
    private func addUser(user: UserObject){
        let newUser = User(context: viewContext)
        newUser.firstName = user.firstName
        newUser.lastName = user.lastName
        newUser.phone = user.phone
        newUser.email = user.email
        newUser.number = Int16(user.number) ?? 0
        newUser.street = user.street
        newUser.city = user.city
        newUser.postal_code = user.postalCode
        newUser.country = user.country
        newUser.note = user.note
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

struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        SheetView()
    }
}
