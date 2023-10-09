//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by luis armendariz on 9/22/23.
//

import SwiftUI

@main
struct AppetizersApp: App {
    
    // initialize order to tabview so it has this object in its environment
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(order) //injecting order into appetizer tab view's environment
        }
    }
}
