//
//  ContentView.swift
//  Appetizers
//
//  Created by luis armendariz on 9/22/23.
//

import SwiftUI

struct AppetizerTabView: View {
    var body: some View {
        TabView{
            AppetizerListView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Casa")
                }
            AccountView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Cuenta")
                }
            OrderView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("Orden")
                }
            
        }
        .accentColor(Color("brandPrimary"))
    }
}















#Preview {
    AppetizerTabView()
}
