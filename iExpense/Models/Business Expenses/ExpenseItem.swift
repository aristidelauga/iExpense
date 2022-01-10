//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Aristide LAUGA on 25/11/2021.
//

import Foundation
import SwiftUI


struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
    let currency: String
}
