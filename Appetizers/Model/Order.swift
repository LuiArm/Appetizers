//
//  Order.swift
//  Appetizers
//
//  Created by luis armendariz on 10/8/23.
//

import SwiftUI

final class Order: ObservableObject {
    
    @Published var items: [Appetizer] = []
    
    var totalPrice: Double {
        items.reduce(0) { $0 + $1.price}
    }
    func deleteItems(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}
