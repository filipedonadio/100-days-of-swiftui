//
//  FormatStyle-LocalCurrency.swift
//  iExpense
//
//  Created by Filipe Donadio on 01/03/2022.
//

import Foundation

extension FormatStyle where Self == FloatingPointFormatStyle<Double>.Currency {
    static var localCurrency: Self {
        .currency(code: Locale.current.currencyCode ?? "USD")
    }
}
