//
//  PersonalExpenseItem.swift
//  iExpense
//
//  Created by Aristide LAUGA on 26/11/2021.
//

import Foundation


struct PersonalExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
    let currency: String
}
