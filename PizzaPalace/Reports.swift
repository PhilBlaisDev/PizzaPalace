//
//  ContentView.swift
//  PizzaPalace
//
//  Created by Philippe Blais on 2021-06-05.
//

import Charts
import SwiftUI
import CoreData

struct Reports: View {
    @Environment(\.managedObjectContext) private var viewContext
    private var symbols = ["keyboard", "hifispeaker.fill", "printer.fill", "tv.fill", "desktopcomputer", "headphones", "tv.music.note", "mic", "plus.bubble", "video"]
    private var threeColumnGrid = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    private var colors: [Color] = [.yellow, .purple, .green]
    private var cells = [ReportCell(title: "$45.00", subtitle: "Avg. Cx spending", color: Color.red),
                         ReportCell(title: "224", subtitle: "Avg. returning customer", color: Color.red),
                         ReportCell(title: "Saturday", subtitle: "Busiest Day", color: Color.red),
                         ReportCell(title: "14%", subtitle: "Return rate", color: Color.red),
                         ReportCell(title: "5 pm", subtitle: "Busiest Time", color: Color.blue),
                         ReportCell(title: "232", subtitle: "Avg. Daily orders", color: Color.blue),
                         ReportCell(title: "+12%", subtitle: "Compared to previous week", color: Color.blue),
                         ReportCell(title: "45", subtitle: "Phone orders", color: Color.blue)]


    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                VStack(spacing: 0) {
                    LazyVGrid(columns: threeColumnGrid) {
                        ForEach(cells, id: \.self) { item in
                            item
                        }
                    }
                }
                Chart1(entries: RevenueTransaction.dataEntriesForDay(22, transactions: RevenueTransaction.allTransactions),
                        entries2: RevenueTransaction.dataEntriesForDay(22, transactions: RevenueTransaction.allEmployeeTransactions)
                ).frame(height: 500)
                        .padding(32)

                LineChart(entries: YearlyRevenueTransaction.dataEntriesForYear(22, transactions: YearlyRevenueTransaction.allTransactions))
                        .frame(height: 500)
                        .padding()

                HStack {
                    Spacer()
                    Button(action: {

                    }, label: {
                        Text("Export to PDF")
                    }).buttonStyle(BlackButtonStyle())

                    Button(action: {

                    }, label: {
                        Text("Export to Excel")
                    }).buttonStyle(BlackButtonStyle())

                    Button(action: {

                    }, label: {
                        Text("Export to CSV")
                    }).buttonStyle(BlackButtonStyle())
                }.padding()
            }
        }.background(Color.white)
    }
}

struct ReportCell: View, Hashable {
    var title: String
    var subtitle: String
    var color: Color
    var body: some View {
        HStack {
            VStack(spacing: 0) {
                Text(title).font(.system(size: 40.0)).foregroundColor(color)
                Text(subtitle).font(.title2).padding()
            }
        }.frame(width: 180, height: 180).padding().background(Color.init(red: 0/255, green: 0/255, blue: 0/255, opacity: 0.1)).cornerRadius(5)

    }
}

struct Reports_Previews: PreviewProvider {
    static var previews: some View {
        Reports().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
