//
//  PersonalView.swift
//  iExpense
//
//  Created by Aristide LAUGA on 26/11/2021.
//

import SwiftUI

@available(iOS 15.0, *)
@available(iOS 15.0, *)
struct PersonalView: View {
    
    @StateObject var expenses = Expenses()
    @StateObject var personalExpenses = PersonalExpenses()
    @State var showingAtPersonalExpense = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(personalExpenses.personalItems) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                                .fontWeight(personalExpenses.changeFontWeight(amount: item.amount))
                        }
                        Spacer()
                        Text(item.amount, format: .currency(code: personalExpenses.chooseCurrency(in: item.currency)))
                    }
                }
                .onDelete { IndexSet in personalExpenses.removeItems(at: IndexSet, expenses: personalExpenses) }
            }
            .navigationTitle("Personal Expenses")
            .toolbar {
                Button(action: {
                    showingAtPersonalExpense = true
                }) {
                    Image(systemName: "plus")
                }
            }.sheet(isPresented: $showingAtPersonalExpense) {
                AddView(expenses: expenses, personalExpenses: personalExpenses)
        }
        }
    }
}

@available(iOS 15.0, *)
struct PersonalView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalView()
    }
}
