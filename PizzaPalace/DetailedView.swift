//
//  DetailedView.swift
//  PizzaPalace
//
//  Created by Philippe Blais on 2021-06-12.
//

import SwiftUI

struct DetailedView: View {
    @Binding var displayViewId: Int

    @FetchRequest(sortDescriptors: [])
    var users: FetchedResults<User>

    @State var user: UserObject = UserObject(email: "employee@email.com")

    var body: some View {
        HStack {
            Spacer()
            VStack(alignment: .trailing) {
                Image("pizza")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 360)
                        .padding(.top, 25.0)
                        .padding([.trailing], 0.0)
                Spacer()
                VStack(spacing: 0) {
                    VStack(spacing: 0) {
                        HStack {
                            HStack {
                                Image(systemName: "envelope")
                                        .foregroundColor(.green).padding(.leading, 10)
                                TextField("Email", text: $user.email).textFieldStyle(PlainTextFieldStyle())
                            }.frame(height: 60)
                                    .background(Color.white)
                                    .cornerRadius(8)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 10)

                            Button(action: {
                                self.displayViewId = 1
                            }, label: {
                                Text("Login").frame(minWidth: 50, minHeight: 35)
                            })

                        }
                        HStack {
                            HStack() {
                                Image(systemName: "lock")
                                        .foregroundColor(.green)
                                        .padding(.leading, 10)
                                SecureField("Password", text: $user.password)
                                        .textFieldStyle(PlainTextFieldStyle())
                            }.frame(height: 60)
                                    .background(Color.white)
                                    .cornerRadius(8)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 10)

                            Button(action: {

                            }, label: {
                                Text("Need Help?").foregroundColor(Color.red).font(Font.headline.weight(.bold))
                            }).buttonStyle(PlainButtonStyle())
                        }

                        HStack() {
                            Button(action: {

                            }, label: {
                                Text("Forgot Password").foregroundColor(Color.red).font(Font.headline.weight(.bold))
                            }).buttonStyle(PlainButtonStyle())
                                    .padding(.horizontal, 20)
                                    .padding(.top, 10)

                            Spacer()
                        }.frame(height: 10)
                    }.padding(40)
                            .background(Color.init(red: 133 / 255, green: 194 / 255, blue: 39 / 255, opacity: 0.93))
                            .cornerRadius(15)
                }
                Spacer()
            }.padding(.trailing, 40)
                    .frame(width: 700)
        }.frame(width: 1300, height: 900)
    }
}