//
//  CustomerVisitsTransactionss.swift
//  PizzaPalace
//
//  Created by Philippe Blais on 2021-06-18.
//


import Charts
import Foundation

struct CustomerVisitsTransactions {
    var day: Int
    var time:Double
    var amount: Double
    
    static func dataEntriesForYear(_ day: Int, transactions:[CustomerVisitsTransactions]) -> [ChartDataEntry] {
    let dayTransactions = transactions.filter{$0.day == day}
           return dayTransactions.map{ChartDataEntry(x: $0.time, y: $0.amount)}
    }

    static var allTransactions:[CustomerVisitsTransactions] {
        [
            CustomerVisitsTransactions(day: 22, time: 0, amount: 0),
            CustomerVisitsTransactions(day: 22, time: 1, amount: 3),
            CustomerVisitsTransactions(day: 22, time: 2, amount: 5),
            CustomerVisitsTransactions(day: 22, time: 3, amount: 12),
            CustomerVisitsTransactions(day: 22, time: 4, amount: 35),
            CustomerVisitsTransactions(day: 22, time: 5, amount: 67),
            CustomerVisitsTransactions(day: 22, time: 6, amount: 75),
            CustomerVisitsTransactions(day: 22, time: 7, amount: 32),
            CustomerVisitsTransactions(day: 22, time: 8, amount: 13),
            CustomerVisitsTransactions(day: 22, time: 9, amount: 2),
            CustomerVisitsTransactions(day: 22, time: 10, amount: 0),
            CustomerVisitsTransactions(day: 22, time: 11, amount: 7),
            CustomerVisitsTransactions(day: 22, time: 12, amount: 23),
            CustomerVisitsTransactions(day: 22, time: 13, amount: 43),
            CustomerVisitsTransactions(day: 22, time: 14, amount: 75),
            CustomerVisitsTransactions(day: 22, time: 15, amount: 37),
            CustomerVisitsTransactions(day: 22, time: 16, amount: 8)
        ]
    }
}
