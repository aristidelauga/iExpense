//
//  BusinessView.swift
//  iExpense
//
//  Created by Aristide LAUGA on 26/11/2021.
//

import SwiftUI

@available(iOS 15.0, *)
struct BusinessView: View {
    
    @StateObject var expenses = Expenses()
    @StateObject var personalExpenses = PersonalExpenses()
    @State var showingAtBusinessExpense = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                                .fontWeight(expenses.changeFontWeight(amount: item.amount))
                        }
                        Spacer()
                        Text(item.amount, format: .currency(code: expenses.chooseCurrency(in: item.currency)))
                    }
                }
                .onDelete { IndexSet in expenses.removeItems(at: IndexSet, expenses: expenses) }
            }
            .navigationTitle("Business Expenses")
            .toolbar {
                Button(action: {
                    showingAtBusinessExpense = true
                }) {
                    Image(systemName: "plus")
                }
            }.sheet(isPresented: $showingAtBusinessExpense) {
                AddView(expenses: expenses, personalExpenses: personalExpenses)
        }
        }
    }
}

@available(iOS 15.0, *)
struct BusinessView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessView()
    }
}
