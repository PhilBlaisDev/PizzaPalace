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
                Text("CLDP")
                LazyVGrid(columns: threeColumnGrid) {
                    ForEach(cells, id: \.self) { item in
                        item
                    }
                }
                Spacer()
                HStack{
                    PieChart().frame(width: 400,height: 500)
                    VStack{
                        Spacer()
                        Text("")
                        Text("Placeholder Text")
                        Text("Placeholder Text")
                        Text("Placeholder Text")
                        Spacer()
                    }
                }

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
        }
    }
}

struct CLDP_Previews: PreviewProvider {
    static var previews: some View {
        CLDP().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
