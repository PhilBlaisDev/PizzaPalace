//
//  DetailedView.swift
//  PizzaPalace
//
//  Created by Philippe Blais on 2021-06-12.
//

import SwiftUI

struct DetailedView: View {
    @Binding var displayViewId: Int

    @FetchRequest(sortDescriptors:[])
    var users: FetchedResults<User>
    
    @State var user: UserObject = UserObject(email: "employee@email.com")
    
    var body: some View {
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
                    TextField("Email", text: $user.email).textFieldStyle(PlainTextFieldStyle())
                        
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
                    self.displayViewId = 1
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

//struct DetailedView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailedView(showLoginView: true)
//    }
//}
