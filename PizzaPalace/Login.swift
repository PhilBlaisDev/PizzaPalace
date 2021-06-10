//
//  ContentView.swift
//  PizzaPalace
//
//  Created by Philippe Blais on 2021-06-05.
//

import SwiftUI
import CoreData

struct UserObject {
    var username = "Me"
    var password = "823he92389u"
}

struct Login: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(sortDescriptors:[])
    var users: FetchedResults<User>
    
    
    @State var user: UserObject = UserObject(username: "Test User")
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
                            .frame(maxWidth: 250)
                            .padding([.top, .horizontal], 15.0)
                    }
                Spacer()
                HStack (spacing: 50){
                    Spacer()
                    VStack(spacing:10){
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
                        
                        HStack(){
                            Button(action: {
                                
                            }, label: {
                                Text("Forgot Password").foregroundColor(Color.red) .font(Font.headline.weight(.bold))
                            }).buttonStyle(PlainButtonStyle())
                            .padding(.horizontal, 30)
                                Spacer()
                        }.frame(height: 10)
                    }
                    VStack {
                        
                        Button(action: {
                            self.showLoginView = true
                        }, label: {
                            Text("Login")
                        })
                        Spacer()
                        Button(action: {
                            
                        }, label: {
                            Text("Need Help?").foregroundColor(Color.red).font(Font.headline.weight(.bold))
                        }).buttonStyle(PlainButtonStyle())
                        Spacer()
                    }.frame(height: 120)
                   Spacer()
                }
                .padding(.leading, 20)
                .padding(.trailing, 20)
                .padding(.top, 25)
                .padding(.bottom, 20)
                .background(Color.init(red: 133/255, green: 194/255, blue: 39/255, opacity: 0.9))
                
                Spacer()
            }
        }
        .background(!showLoginView ? Image("pizza_bg").resizable().aspectRatio(contentMode: .fill) : Image("white_bg").resizable().aspectRatio(contentMode: .fill))
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
