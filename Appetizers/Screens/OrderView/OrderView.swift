//
//  OrderView.swift
//  Appetizers
//
//  Created by luis armendariz on 9/22/23.
//

import SwiftUI

struct OrderView: View {
    var body: some View {
        NavigationStack{
            VStack{
                List{
                    ForEach(MockData.orderItems){ appetizer in
                        AppetizerListCell(appetizer: appetizer)
                    }
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
}

#Preview {
    OrderView()
}
