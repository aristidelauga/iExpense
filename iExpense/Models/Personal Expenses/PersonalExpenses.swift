//
//  Expenses.swift
//  iExpense
//
//  Created by Aristide LAUGA on 25/11/2021.
//

import Foundation

@available(iOS 15.0, *)
class PersonalExpenses: ObservableObject {
    @Published var personalItems = [PersonalExpenseItem]() {
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(personalItems) {
                UserDefaults.standard.set(encoded, forKey: "PersonalItems")
            }
        }
    }
    init() {
        if let savedPersonalItems = UserDefaults.standard.data(forKey: "PersonalItems") {
            if let decodedPersonalItems = try? JSONDecoder().decode([PersonalExpenseItem].self, from: savedPersonalItems) {
                personalItems = decodedPersonalItems
                return
            }
        }
        personalItems = []
    }
}

