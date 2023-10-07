//
//  OrderView.swift
//  Appetizers
//
//  Created by luis armendariz on 9/22/23.
//

import SwiftUI

struct OrderView: View {
    // Initialize to use orderItems else where
    @State private var orderItems = MockData.orderItems
    var body: some View {
        NavigationStack{
            VStack{
                List{
                    ForEach(orderItems){ appetizer in
                        AppetizerListCell(appetizer: appetizer)
                    }
                    .onDelete(perform: deleteItems)
                }
                .listStyle(InsetGroupedListStyle())
                
                Button {
                    print("Order placed")
                }label: {
                    APButton(title: "$99.99")
                }.padding(.bottom, 10)
            }
            .navigationTitle("💲 Orders")
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        orderItems.remove(atOffsets: offsets)
    }
}

#Preview {
    OrderView()
}
