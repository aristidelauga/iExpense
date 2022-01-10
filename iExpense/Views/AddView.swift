//
//  AddView.swift
//  iExpense
//
//  Created by Aristide LAUGA on 25/11/2021.
//

import SwiftUI

@available(iOS 15.0, *)
struct AddView: View {
    @ObservedObject var expenses: Expenses
    @ObservedObject var personalExpenses: PersonalExpenses
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    @State public var currency = ""
    
    let types = ["Business", "Personal"]
    let currenciesTest = ["Euro", "Dollar", "Sterling", "Rupee"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) { Text($0) }
                }.pickerStyle(.segmented)
                
                
                Picker("Currency", selection: $currency) { ForEach(currenciesTest, id: \.self) { Text($0) }}
                
                TextField("Amount", value: $amount, format: .currency(code: currency)).keyboardType(.decimalPad) }
                    .navigationTitle("Add new expense")
                    .toolbar {
                Button("Save") {
                    if type == types[0] {
                        let newBusinessItem = ExpenseItem(name: name, type: type, amount: amount, currency: currency)
                        expenses.items.append(newBusinessItem)
                    } else {
                        let newPersonalItem = PersonalExpenseItem(name: name, type: type, amount: amount, currency: currency)
                        personalExpenses.personalItems.append(newPersonalItem)
                        
                    }
                    dismiss()
                }
            }
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
    
    
}

@available(iOS 15.0, *)
struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses(), personalExpenses: PersonalExpenses())
    }
}
