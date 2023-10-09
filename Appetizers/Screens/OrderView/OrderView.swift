//
//  OrderView.swift
//  Appetizers
//
//  Created by luis armendariz on 9/22/23.
//

import SwiftUI

struct OrderView: View {
   
    @EnvironmentObject var order: Order
    
    
    var body: some View {
        NavigationStack{
            ZStack{
                VStack{
                    List{
                        ForEach(order.items){ appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: order.deleteItems)
                    }
                    .listStyle(InsetGroupedListStyle())
                    
                    Button {
                        print("Order placed")
                    }label: {
                        APButton(title: "$\(order.totalPrice, specifier: "%.2f") - Place Order")
                    }.padding(.bottom, 10)
                }
                
                if order.items.isEmpty {
                    EmptyState(imageName: "empty-order", message: "There are no items in your order. Please look at out our options to add an appetizer.")
                }
            }
            
            .navigationTitle("💲 Orders")
        }
    }
    
   
}

#Preview {
    OrderView()
}
