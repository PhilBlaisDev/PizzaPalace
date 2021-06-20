//
//  ContentView.swift
//  PizzaPalace
//
//  Created by Philippe Blais on 2021-06-05.
//

import SwiftUI
import CoreData

struct CLDP: View {
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
                Spacer()
                titleView(title: "Customers by discount")
                HStack {
                    Spacer()
                    PieChart(entries: CustomerDiscounts.dataEntriesForYear(22, transactions: CustomerDiscounts.allTransactions)).frame(width: 400, height: 500)
                    Spacer()
                }

                titleView(title: "Customer Visits")

                CxVisitsLineChart(entries: CustomerVisitsTransactions.dataEntriesForYear(22, transactions: CustomerVisitsTransactions.allTransactions))
                        .frame(height: 500)
                        .padding()
            }.padding()
        }
    }
}