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
            VStack(spacing: 0) {
                VStack(spacing: 0) {
                    HStack {
                        cells[0]
                        Divider()
                        cells[1]
                        Divider()
                        cells[2]
                    }.fixedSize(horizontal: false, vertical: false)
                    Divider()
                    Spacer().padding()
                    HStack {
                        cells[3]
                        Divider()
                        cells[4]
                        Divider()
                        cells[5]
                        Divider()
                        cells[6]
                    }.fixedSize(horizontal: false, vertical: false)
                    Divider()
                }.padding(20)

                titleView(title: "Revenue vs. Staff Cost", filterArray: ["Date", "Amount", "Time"])

                Chart1(entries: RevenueTransaction.dataEntriesForDay(22, transactions: RevenueTransaction.allTransactions),
                        entries2: RevenueTransaction.dataEntriesForDay(22, transactions: RevenueTransaction.allEmployeeTransactions)
                ).frame(height: 500)
                        .padding(.horizontal, 19)
                        .padding(.vertical, 20)
                        .shadow(radius: 2)

                titleView(title: "Sales", filterArray: ["from: to:", "Date", "Amount", "Time"])

                LineChart(entries: YearlyRevenueTransaction.dataEntriesForYear(22, transactions: YearlyRevenueTransaction.allTransactions))
                        .frame(height: 500).shadow(radius: 2)
            }.padding()
        }.background(Color.white)
    }
}

struct ReportCell: View, Hashable {
    var title: String
    var subtitle: String
    var color: Color
    var body: some View {
        HStack {
            VStack(alignment: .center, spacing: 0) {
                Text(title).font(.system(size: 30.0)).foregroundColor(color)
                Text(subtitle).font(.title3).multilineTextAlignment(.center)
            }.padding()
        }.frame(maxWidth: .infinity)
    }
}

// Yearly Salres filter from: to:,
// Customer by discount day, week and month
// Customer Visits day, week and month


struct titleView: View, Hashable {
    var title: String
    let array = ["Export to PDF", "Export to Excel", "Export to CSV"]
    var filterArray:Array<String>
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title).font(.system(size: 30.0)).foregroundColor(Color.black)
                Spacer()
                HStack{
                    Image(systemName: "line.horizontal.3.decrease.circle").foregroundColor(Color.black)
                    MenuButton("Filter by: ") {
                        Button(action: {
                            print("Clicked an item")
                        }) {
                            ForEach(filterArray, id: \.self) { item in
                                Button(action: {}) {
                                    Text(item)
                                }.buttonStyle(BlackButtonStyle())
                            }
                        }
                    }.menuButtonStyle(BorderlessPullDownMenuButtonStyle())
                }.padding(10)
                        .frame(width: 110)
                        .background(Color.init(red: 0 / 255, green: 0 / 255, blue: 0 / 255, opacity: 0.1))
                        .cornerRadius(15)
                HStack{
                    Image(systemName: "square.and.arrow.up").foregroundColor(Color.black)
                    MenuButton("Export") {
                        Button(action: {
                            print("Clicked an item")
                        }) {
                            ForEach(array, id: \.self) { item in
                                Button(action: {}) {
                                    Text(item)
                                }.buttonStyle(BlackButtonStyle())
                            }
                        }
                    }.menuButtonStyle(BorderlessPullDownMenuButtonStyle())
                }.padding(10)
                .frame(width: 110)
                .background(Color.init(red: 0 / 255, green: 0 / 255, blue: 0 / 255, opacity: 0.1))
                .cornerRadius(15)
            }
            Divider().background(Color.black).frame(maxWidth: 300)
        }.padding(20)
    }
}

struct Reports_Previews: PreviewProvider {
    static var previews: some View {
        Reports().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
