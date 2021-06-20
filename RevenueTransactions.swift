//
//  RevenueTransactions.swift
//  PizzaPalace
//
//  Created by Philippe Blais on 2021-06-18.
//


import Charts
import Foundation

struct RevenueTransaction {
    var day: Int
    var time: Double
    var amount: Double
    
    static func dataEntriesForDay(_ day: Int, transactions:[RevenueTransaction]) -> [BarChartDataEntry] {
    let dayTransactions = transactions.filter{$0.day == day}
           return dayTransactions.map{BarChartDataEntry(x: $0.time, y: $0.amount)}
    }
    static var time = ["10.00 am", "10.30 am", "11.00 am", "11.30 am", "12.00 pm", "12.30 pm", "1.00 pm",
                       "1.30 pm", "2.00 pm", "2.30 pm", "3.00 pm", "3.30 pm", "4.00 pm", "4.30 pm", "5.00 pm", "5.30 pm", "6.00 pm", "6.30 pm", "7.00 pm",
                       "7.30 pm", "8.00 pm", "8.30 pm", "9.00 pm", "9.30 pm", "10.00 pm", "10.30 pm"]


    static var allTransactions:[RevenueTransaction] {
        [
            RevenueTransaction(day: 22, time: 0, amount: 0.00),// 10 am
            RevenueTransaction(day: 22, time: 1, amount: 0.00),
            RevenueTransaction(day: 22, time: 2, amount: 132.50),// 11 am
            RevenueTransaction(day: 22, time: 3, amount: 238.50),
            RevenueTransaction(day: 22, time: 4, amount: 371.00),// 12 am
            RevenueTransaction(day: 22, time: 5, amount: 291.50),
            RevenueTransaction(day: 22, time: 6, amount: 212.00),// 1 pm
            RevenueTransaction(day: 22, time: 7, amount: 132.50),
            RevenueTransaction(day: 22, time: 8, amount: 53.00),// 2 pm
            RevenueTransaction(day: 22, time: 9, amount: 26.50),
            RevenueTransaction(day: 22, time: 10, amount: 0.00),// 3 pm
            RevenueTransaction(day: 22, time: 11, amount: 0.00),
            RevenueTransaction(day: 22, time: 12, amount: 0.00),// 4 pm
            RevenueTransaction(day: 22, time: 13, amount: 53.00),
            RevenueTransaction(day: 22, time: 14, amount: 79.50),// 5 pm
            RevenueTransaction(day: 22, time: 15, amount: 106.00),
            RevenueTransaction(day: 22, time: 16, amount: 291.50),// 6 pm
            RevenueTransaction(day: 22, time: 17, amount: 371.00),
            RevenueTransaction(day: 22, time: 18, amount: 344.50),// 7 pm
            RevenueTransaction(day: 22, time: 19, amount: 291.50),
            RevenueTransaction(day: 22, time: 20, amount: 318.00),// 8 pm
            RevenueTransaction(day: 22, time: 21, amount: 212.00),
            RevenueTransaction(day: 22, time: 22, amount: 185.50),// 9 pm
            RevenueTransaction(day: 22, time: 23, amount: 159.00),
            RevenueTransaction(day: 22, time: 24, amount: 0.00),// 10 pm
            RevenueTransaction(day: 22, time: 25, amount: 0.00)
        ]
    }

    static var allEmployeeTransactions:[RevenueTransaction] {
        [
            RevenueTransaction(day: 22, time: 0, amount: 0.00),// 10 am
            RevenueTransaction(day: 22, time: 1, amount: 12.50),
            RevenueTransaction(day: 22, time: 2, amount: 12.50),// 11 am
            RevenueTransaction(day: 22, time: 3, amount: 25.00),
            RevenueTransaction(day: 22, time: 4, amount: 25.00),// 12 am
            RevenueTransaction(day: 22, time: 5, amount: 25.00),
            RevenueTransaction(day: 22, time: 6, amount: 37.50),// 1 pm
            RevenueTransaction(day: 22, time: 7, amount: 37.50),
            RevenueTransaction(day: 22, time: 8, amount: 25.00),// 2 pm
            RevenueTransaction(day: 22, time: 9, amount: 25.00),
            RevenueTransaction(day: 22, time: 10, amount: 12.50),// 3 pm
            RevenueTransaction(day: 22, time: 11, amount: 12.50),
            RevenueTransaction(day: 22, time: 12, amount: 12.50),// 4 pm
            RevenueTransaction(day: 22, time: 13, amount: 25.00),
            RevenueTransaction(day: 22, time: 14, amount: 25.00),// 5 pm
            RevenueTransaction(day: 22, time: 15, amount: 37.50),
            RevenueTransaction(day: 22, time: 16, amount: 37.50),// 6 pm
            RevenueTransaction(day: 22, time: 17, amount: 37.50),
            RevenueTransaction(day: 22, time: 18, amount: 37.50),// 7 pm
            RevenueTransaction(day: 22, time: 19, amount: 37.50),
            RevenueTransaction(day: 22, time: 20, amount: 37.50),// 8 pm
            RevenueTransaction(day: 22, time: 21, amount: 37.50),
            RevenueTransaction(day: 22, time: 22, amount: 25.00),// 9 pm
            RevenueTransaction(day: 22, time: 23, amount: 25.00),
            RevenueTransaction(day: 22, time: 24, amount: 25.00),// 10 pm
            RevenueTransaction(day: 22, time: 25, amount: 25.00)
        ]
    }

    static func formatForLeftSideLegend() -> [String]{
        var legendFormat = [String]()
        allTransactions.forEach { trans in
            legendFormat.append("$ \(trans.amount)")
        }
        return legendFormat
    }
}
