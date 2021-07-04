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
            QuickMenuTitle()
            HStack{
                VStack{
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
                    }
                    
                    HStack(spacing:0){
                        Spacer()
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
                }.padding(.vertical, 20)
                Divider()
                VStack(alignment: .leading){
                    AnnouncementsTitle()
                    ScrollView(showsIndicators: false){
                        VStack(alignment: .leading){
                            
                            VStack(alignment: .leading){
                                Text("COVID-19 response").font(.title).bold()
                                Image("govbc-icon").resizable().scaledToFit().frame(maxHeight:100)
                                Text("Information for residents of B.C. about COVID-19,\n - Vaccines\n - Benefits and supports\n - PHO orders and guidelines").padding()
                                Divider()
                            }
                            VStack(alignment: .leading){
                                Text("Summer BBQ").font(.title).bold()
                                HStack(alignment: .top){
                                    Image("bbq").resizable().scaledToFit().frame(maxHeight:100)
                                    Text("Paulo's super summer BBQ extravaganza is back on, July 16, 2021. We missed out last year, this year is going to be nuts! Bring your loved ones and don't warn the cops.").padding()

                                }.padding()
                                Divider()
                            }
                            VStack(alignment: .leading){
                                Text("Implementation of new System").font(.title).bold()
                                HStack{
                                    Image("ba").resizable().scaledToFit().frame(maxHeight:100)
                                    Image("imp").resizable().scaledToFit().frame(maxHeight:100)
                                }
                                
                                Text("New BA team will be implementing the new system this Friday at 5:30 pm, during our busiest time. Even though that is a terrible idea. April's fools! Even though it's June 20.")
                                Divider()
                            }
                            
                            VStack(alignment: .leading){
                                Text("Schedules will be ready a day early").font(.title).bold()
                                Image("sche").resizable().scaledToFit().frame(maxHeight:100)
                                Text("With the arrival of the new scheduling system, you will start getting your schedules much earlier. ")
                                Divider()

                            }
                            VStack(alignment: .leading){
                                Text("He's back!").font(.title).bold()
                                Image("voldemort").resizable().scaledToFit().frame(maxHeight:100)
                                Text("The Return of Lord Voldemort took place on the 24 June, 1995 in the graveyard of Little Hangleton, when Voldemort was restored to physical form and full magical power after being incorporeal for nearly fourteen years.")
                                Divider()

                            }
                        }
                    }
                }.padding([.top, .leading], 20)
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
                            Color.blue:
                            Color.init(red: 0/255, green: 0/255, blue: 255/255, opacity: 1.0)
                            )
            
            // White text color on release, black on press.
            .foregroundColor(!configuration.isPressed ? .white : .black)
            .cornerRadius(8)
    }
}


struct QuickMenuTitle: View{
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Welcome, Beatrice").font(.system(size: 30.0)).foregroundColor(Color.black).padding(.horizontal, 20).padding(.vertical, 10)
                Spacer()
                Text("1:30 pm - June 21, 2021").font(.system(size: 18.0)).foregroundColor(Color.black).padding(.horizontal, 20)
            }
           
            Text("What would you like to do today?").font(.system(size: 20.0)).foregroundColor(Color.black).padding(.horizontal, 20)

        }
    }
}

struct AnnouncementsTitle: View{
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Announcements").font(.system(size: 20.0)).foregroundColor(Color.black)
                Spacer()
            }
            Divider()
        }
    }
}
