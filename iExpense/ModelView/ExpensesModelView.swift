//
//  ExpensesModelView.swift
//  iExpense
//
//  Created by Aristide LAUGA on 25/11/2021.
//

import Foundation
import SwiftUI


@available(iOS 15.0, *)
extension Expenses {
    func removeItems(at offsets: IndexSet, expenses: Expenses) {
        expenses.items.remove(atOffsets: offsets)
    }
    
    func chooseCurrency(in currency: String) -> String {
        
        switch currency {
        case "Euro":
            return "EUR"
        case "Dollar":
            return "USD"
        case "Sterling":
            return "GBP"
        case "Rupee":
            return "INR"
        default:
            return "USD"
        }
    }
    
    func changeFontWeight(amount: Double) -> Font.Weight {
        
        var text: Font.Weight
        
        switch amount {
        case 0..<10:
            text = .thin
            return text
            
        case 10..<250.00:
            text = .semibold
            return text
            
        case 250.00..<amount:
            text = .bold
            return text
            
        default:
            text = .regular
            return text
        }
    }
    
    
    enum fontsType {
    case thin
    case semibold
    }
    
}


@available(iOS 15.0, *)
extension PersonalExpenses {
    
    func removeItems(at offsets: IndexSet, expenses: PersonalExpenses) {
        expenses.personalItems.remove(atOffsets: offsets)
    }
    
    func chooseCurrency(in currency: String) -> String {
        
        switch currency {
        case "Euro":
            return "EUR"
        case "Dollar":
            return "USD"
        case "Sterling":
            return "GBP"
        case "Rupee":
            return "INR"
        default:
            return "USD"
        }
    }
    
    func changeFontWeight(amount: Double) -> Font.Weight {
        
        var text: Font.Weight
        
        switch amount {
        case 0..<10:
            text = .thin
            return text
            
        case 10..<250.00:
            text = .semibold
            return text
            
        case 250.00..<amount:
            text = .bold
            return text
            
        default:
            text = .regular
            return text
        }
    }
    
    
    enum fontsType {
    case thin
    case semibold
    }
    
}
