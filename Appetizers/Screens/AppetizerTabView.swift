//
//  ContentView.swift
//  Appetizers
//
//  Created by luis armendariz on 9/22/23.
//

import SwiftUI

struct AppetizerTabView: View {
    
    @EnvironmentObject var order: Order
    var body: some View {
        TabView{
            AppetizerListView()
                .tabItem { Label("Home", systemImage: "house")}
            AccountView()
                .tabItem {
                    Label("Account", systemImage: "person")
                }
            OrderView()
                .tabItem {
                    Label("Order", systemImage: "bag")
                }
                .badge(order.items.count)
            
        }
        .accentColor(Color("brandPrimary"))
    }
}















#Preview {
    AppetizerTabView()
}
