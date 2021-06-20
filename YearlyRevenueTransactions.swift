//
//  YearlyRevenueTransactions.swift
//  PizzaPalace
//
//  Created by Philippe Blais on 2021-06-18.
//


import Charts
import Foundation

struct YearlyRevenueTransaction {
    var day: Int
    var month:Double
    var amount: Double
    
    static func dataEntriesForYear(_ day: Int, transactions:[YearlyRevenueTransaction]) -> [ChartDataEntry] {
    let dayTransactions = transactions.filter{$0.day == day}
           return dayTransactions.map{ChartDataEntry(x: $0.month, y: $0.amount)}
    }
    static var months = ["Jan-20", "Feb-20", "Mar-20", "Apr-20", "May-20", "June-20", "July-20", "Aug-20", "Sept-20", "Oct-20", "Nov-20", "Dec-20", "Jan-21", "Feb-21", "Mar-21", "Apr-21", "May-21"]

    static var allTransactions:[YearlyRevenueTransaction] {
        [
            YearlyRevenueTransaction(day: 22, month: 0, amount: 45000.00),
            YearlyRevenueTransaction(day: 22, month: 1, amount: 40000.00),
            YearlyRevenueTransaction(day: 22, month: 2, amount: 42000.00),
            YearlyRevenueTransaction(day: 22, month: 3, amount: 36000.00),
            YearlyRevenueTransaction(day: 22, month: 4, amount: 35000.00),
            YearlyRevenueTransaction(day: 22, month: 5, amount: 32000.00),
            YearlyRevenueTransaction(day: 22, month: 6, amount: 28000.00),
            YearlyRevenueTransaction(day: 22, month: 7, amount: 25000.00),
            YearlyRevenueTransaction(day: 22, month: 8, amount: 22000.00),
            YearlyRevenueTransaction(day: 22, month: 9, amount: 21000.00),
            YearlyRevenueTransaction(day: 22, month: 10, amount: 18000.00),
            YearlyRevenueTransaction(day: 22, month: 11, amount: 16000.00),
            YearlyRevenueTransaction(day: 22, month: 12, amount: 15000.00),
            YearlyRevenueTransaction(day: 22, month: 13, amount: 14500.00),
            YearlyRevenueTransaction(day: 22, month: 14, amount: 17000.00),
            YearlyRevenueTransaction(day: 22, month: 15, amount: 18000.00),
            YearlyRevenueTransaction(day: 22, month: 16, amount: 22000.00)
        ]
    }
}
