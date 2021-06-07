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
    var password = "823he92389u"
}

struct Login: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State var user: User = User(username: "Test User")
    @State var showLoginView: Bool = false

    var body: some View {
        VStack(spacing: 20) {
            if showLoginView {
                ToobarItemPlacement()
            } else {
                Spacer()
                HStack (spacing: 50){
                    Spacer()
                    Image("pizza")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 180)
                            .padding([.top, .horizontal], 15.0)
                    }
                Spacer()
                HStack (spacing: 50){
                    Spacer()
                    VStack(spacing:20){
                        HStack(){
                            Image(systemName: "envelope")
                                .foregroundColor(.green)
                            TextField("Username", text: $user.username).textFieldStyle(PlainTextFieldStyle())
                                
                        }.frame(height: 60)
                        .padding(.horizontal, 20)
                        .background(Color.white)
                        .cornerRadius(8)
                        .padding(.horizontal, 20)
                    
                        HStack(){
                            Image(systemName: "lock")
                                .foregroundColor(.green)
                            SecureField("Password", text: $user.password)
                                .textFieldStyle(PlainTextFieldStyle())
                                
                        }.frame(height: 60)
                        .padding(.horizontal, 20)
                        .background(Color.white)
                        .cornerRadius(8)
                        .padding(.horizontal, 20)
                    }
                    VStack {
                        Button(action: {
                            self.showLoginView = true
                        }, label: {
                            Text("Login")
                        })
                        .padding(25)
                        .foregroundColor(.blue)
                        .cornerRadius(8)
                    }
                   Spacer()

                }
                Spacer()
            }
        }
        .background(Image("pizza_bg").resizable().aspectRatio(contentMode: .fill))
        .buttonStyle(MenuButtonStyle())
    }
}


struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

extension NSTextField {
    open override var focusRingType: NSFocusRingType {
        get { .none }
        set { }
    }
}
