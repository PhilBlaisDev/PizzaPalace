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
    @FetchRequest(sortDescriptors: [])
    var users: FetchedResults<User>
    @State var date: Date = Date()
    @State var user = UserObject()
    let languageArray = ["English", "French"]
    @State var isChecked:Bool = false

    var body: some View {
        VStack(alignment: .leading) {
            Text("Create Customer Account")
                    .font(.largeTitle)
                    .foregroundColor(Color.white)
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                    .padding(.bottom, 10)
            HStack {
                leftSide().padding()
                rightSide().padding()
            }.background(Color.white)

        }
                .frame(width: 1200, height: 850, alignment: .top)
                .background(Color.black)
    }


    fileprivate func leftSide() -> some View {
        return VStack(alignment: .leading) {

            generateTitle(title: "Details")

            HStack(spacing: 10) {
                Spacer()
                VStack {
                    HStack {
                        Text("First Name:").frame(width: 100, alignment: .leading)
                        TextField("First Name", text: $user.firstName).textFieldStyle(PlainTextFieldStyle()).padding(10)
                    }

                    HStack {
                        Text("Last Name:").frame(width: 100, alignment: .leading)
                        TextField("Last Name", text: $user.lastName).textFieldStyle(PlainTextFieldStyle()).padding(10)
                    }

                    HStack {
                        Text("Email:").frame(width: 100, alignment: .leading)
                        TextField("Email", text: $user.email).textFieldStyle(PlainTextFieldStyle()).padding(10)
                    }

                    HStack {
                        Text("Phone Number:").frame(width: 100, alignment: .leading)
                        TextField("Phone Number", text: $user.phone).textFieldStyle(PlainTextFieldStyle()).padding(10)
                    }

                    HStack {
                        Text("Password:").frame(width: 100, alignment: .leading)
                        SecureField("Password", text: $user.password).textFieldStyle(PlainTextFieldStyle()).padding(10)
                    }
                }
            }.padding(.horizontal)

            generateTitle(title: "Payment Method")

            HStack(spacing: 10) {
                Spacer()
                VStack {
                    HStack {
                        Image("card-mastercard").resizable().scaledToFit().frame(height: 30)
                        Image("card-visa").resizable().scaledToFit().frame(height: 30)
                        Spacer()
                    }.padding(.horizontal)
                    .padding(.top)
                    .padding(.bottom, 0)
                    HStack {
                        Text("Card Number:").frame(width: 100, alignment: .leading)
                        TextField("Card Number", text: $user.cardNumber).textFieldStyle(PlainTextFieldStyle()).padding(10)
                    }.padding(.horizontal)
                    .padding(.bottom, 10)
                    HStack {
                        VStack (alignment: .leading){
                            Text("Expiration (MM/YY):")
                            TextField("MM/YY", text: $user.expDate).textFieldStyle(PlainTextFieldStyle())
                        }
                        VStack (alignment: .leading){
                            Text("Card Security Code:")
                            SecureField("CSC", text: $user.csc).textFieldStyle(PlainTextFieldStyle())
                        }
                    }.padding(.horizontal)
                }
            }

            generateTitle(title: "Language")
            Menu {
                ForEach(languageArray, id: \.self) { item in
                    Button(action: {

                    }) {
                        Text(item)
                    }
                }
            } label: {
                Text("English").padding(10)
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 30)

            Spacer()
        }
    }

    fileprivate func rightSide() -> some View {
        return VStack(alignment: .leading) {

            generateTitle(title: "Date of birth")

            VStack {
                DatePicker("Date", selection: $date, displayedComponents: [.date])
                        .datePickerStyle(CompactDatePickerStyle())
            }.padding().padding(.horizontal, 20)

            generateTitle(title: "Home Address")

            HStack(spacing: 10) {
                Spacer()
                VStack {
                    HStack {
                        Text("House Number:").frame(width: 100, alignment: .leading)
                        TextField("House Number", text: $user.number).textFieldStyle(PlainTextFieldStyle()).padding(10)
                    }
                    HStack {
                        Text("Street:").frame(width: 100, alignment: .leading)
                        TextField("Street", text: $user.street).textFieldStyle(PlainTextFieldStyle()).padding(10)
                    }
                    HStack {
                        Text("City:").frame(width: 100, alignment: .leading)
                        TextField("City", text: $user.city).textFieldStyle(PlainTextFieldStyle()).padding(10)
                    }
                    HStack {
                        Text("Postal Code:").frame(width: 100, alignment: .leading)
                        TextField("Postal Code", text: $user.postalCode).textFieldStyle(PlainTextFieldStyle()).padding(10)
                    }
                    HStack {
                        Text("Country:").frame(width: 100, alignment: .leading)
                        TextField("Country", text: $user.country).textFieldStyle(PlainTextFieldStyle()).padding(10)
                    }
                }
            }.padding(.horizontal)

            generateTitle(title: "Loyalty")

            HStack {
                Button(action:toggle){
                    HStack{
                        Image(systemName: isChecked ? "checkmark.square": "square")
                        Text("Join our loyalty Program")
                    }
                }.buttonStyle(PlainButtonStyle()).padding(.horizontal)
            }.padding()

            generateTitle(title: "Notes")
            HStack {
                Text("Notes:").frame(width: 100, alignment: .leading).padding(.leading, 20)
                TextField("Notes", text: $user.note).textFieldStyle(PlainTextFieldStyle()).padding(10)
            }.padding(.horizontal)

            Spacer()
            HStack(spacing: 20) {
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

    fileprivate func generateTitle(title: String) -> some View {
        return VStack(alignment: .leading) {
            Text(title)
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                    .padding(.bottom, 0)
                    .font(.largeTitle)
            Divider().padding(.horizontal, 20)
        }
    }

    private func deleteUsers(offsets: IndexSet) {
        withAnimation {
            offsets.map {
                users[$0]
            }.forEach(viewContext.delete)

            saveContext()
        }
    }

    private func toggle(){
        isChecked = !isChecked
        user.isLoyaltyMember = isChecked
    }

    private func addUser(user: UserObject) {
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
        newUser.password = user.password
        newUser.cardNumber = Int32(user.cardNumber) ?? 0
        newUser.date = user.expDate
        newUser.csc = Int16(user.csc) ?? 0
        newUser.isLoyaltyMember = user.isLoyaltyMember

        saveContext()
    }

    private func saveContext() {
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
