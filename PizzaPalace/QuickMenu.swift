//
//  ContentView.swift
//  PizzaPalace
//
//  Created by Philippe Blais on 2021-06-05.
//

import SwiftUI
import CoreData



struct MenuItem {
    var id: Int?
    var title: String = ""
}

struct QuickMenu: View {
    @Binding var displayViewId: Int
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode
    @State private var showingSheet = false
    private let squareDimension:CGFloat = 170.0
    private let btnFontSize:CGFloat = 22
    
    var body: some View {
        VStack(spacing: 0){
            HStack(spacing:0){
                Button(action: {
                    showingSheet.toggle()
                }, label: {
                    Text("Create Customer account")
                        .frame(minWidth: squareDimension, maxWidth: squareDimension, minHeight: squareDimension, maxHeight: squareDimension)
                        .padding()
                        .font(.system(size: btnFontSize))
                        .multilineTextAlignment(.center)
                })
                .padding()
                .buttonStyle(SquareButtonStyle())
                .sheet(isPresented: $showingSheet) {
                    SheetView()
                }

                Button(action: {
                    self.displayViewId = 2
                }, label: {
                    Text("Place Order")
                        .frame(minWidth: squareDimension, maxWidth: squareDimension, minHeight: squareDimension, maxHeight: squareDimension)
                        .padding()
                        .font(.system(size: btnFontSize))
                        .multilineTextAlignment(.center)
                })
                .padding()
                .buttonStyle(SquareButtonStyle())
                Spacer()
            }
            
            HStack(spacing:0){
                Button(action: {
                    self.displayViewId = 4
                }, label: {
                    Text("Make a payment")
                        .frame(minWidth: squareDimension, maxWidth: squareDimension, minHeight: squareDimension, maxHeight: squareDimension)
                        .padding()
                        .font(.system(size: btnFontSize))
                        .multilineTextAlignment(.center)
                })
                .padding()
                .buttonStyle(SquareButtonStyle())

                Button(action: {
                    self.displayViewId = 5
                }, label: {
                    Text("Make a Reservation")
                        .frame(minWidth: squareDimension, maxWidth: squareDimension, minHeight: squareDimension, maxHeight: squareDimension)
                        .padding()
                        .font(.system(size: btnFontSize))
                        .multilineTextAlignment(.center)
                })
                .padding()
                .buttonStyle(SquareButtonStyle())
                Spacer()
            }
            Spacer()
        }.background(Color.white)
    }
}

struct SquareButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(12)
            
            // Indigo background color on release, yellow on press.
            .background(!configuration.isPressed ?
                            Color.init(red: 0/255, green: 0/255, blue: 0/255, opacity: 0.4):
                            Color.init(red: 0/255, green: 0/255, blue: 255/255, opacity: 0.4)
                            )
            
            // White text color on release, black on press.
            .foregroundColor(!configuration.isPressed ? .white : .black)
            .cornerRadius(8)
    }
}
