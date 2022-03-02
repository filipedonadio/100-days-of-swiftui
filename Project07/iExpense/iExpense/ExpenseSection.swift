//
//  ExpenseSection.swift
//  iExpense
//
//  Created by Filipe Donadio on 02/03/2022.
//

import SwiftUI

struct ExpenseSection: View {
    let title: String
    let expenses: [ExpenseItem]
    let deleteItems: (IndexSet) -> Void

    var body: some View {
        if !expenses.isEmpty {
            Section(title) {
                ForEach(expenses) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        
                        Spacer()
                        
                        Text(item.amount, format: .localCurrency)
                            .style(for: item)
                    }
                }
                .onDelete(perform: deleteItems)
            }
        }
    }
}

struct ExpenseSection_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseSection(title: "Example", expenses: []) { _ in }
    }
}