//
//  String-EmptyChecking.swift
//  CupcakeCorner
//
//  Created by Filipe Donadio on 04/03/2022.
//

import Foundation

extension String {
    var isReallyEmpty: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
