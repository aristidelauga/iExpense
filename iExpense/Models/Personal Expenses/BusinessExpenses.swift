//
//  BusinessExpenses.swift
//  iExpense
//
//  Created by Aristide LAUGA on 26/11/2021.
//

import Foundation

@available(iOS 15.0, *)
@Published var businessItems = [BusinessView]() {
    didSet {
        let encoder = JSONEncoder()
        
        if let encoded = try? encoder.encode(items) {
            UserDefaults.standard.set(encoded, forKey: "Items")
        }
    }
}

init() {
    if let savedBusinessItems = UserDefaults.standard.data(forKey: "Items") {
        if let decodedBusinessItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedBusinessItems) {
            items = decodedBusinessItems
            return
        }
    }
    items = []
}
