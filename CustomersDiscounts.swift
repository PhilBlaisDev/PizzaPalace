//
//  CustomerDiscountss.swift
//  PizzaPalace
//
//  Created by Philippe Blais on 2021-06-18.
//


import Charts
import Foundation

struct CustomerDiscounts {
    var day: Int
    var value:Double
    var label:String

    static func dataEntriesForYear(_ day: Int, transactions:[CustomerDiscounts]) -> [PieChartDataEntry] {
        let dayTransactions = transactions.filter{$0.day == day}
        return dayTransactions.map{PieChartDataEntry(value: $0.value, label: $0.label)}
    }

    static var allTransactions:[CustomerDiscounts] {
        [
            CustomerDiscounts(day: 22, value: 15, label: "10% Discount"),
            CustomerDiscounts(day: 22, value: 23, label: "15% Discount"),
            CustomerDiscounts(day: 22, value: 27, label: "20% Discount"),
            CustomerDiscounts(day: 22, value: 35, label: "Free Delivery")
        ]
    }
}
