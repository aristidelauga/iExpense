//
//  ContentView.swift
//  iExpense
//
//  Created by Aristide LAUGA on 10/11/2021.
//

import SwiftUI

@available(iOS 15.0, *)
struct ContentView: View {
    @StateObject var expenses = Expenses()
    @StateObject var personalExpenses = PersonalExpenses()
    @State var showingAtExpense = false
    
    
    var body: some View {
        TabView {
            PersonalView()
                .tabItem { Label("Personal", systemImage: "person") }
            BusinessView()
                .tabItem { Label("Business", systemImage: "case") }
        }
    }
}

@available(iOS 15.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
