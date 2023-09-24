//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by luis armendariz on 9/22/23.
//

import SwiftUI

struct AppetizerListView: View {
//    @StateObject var viewModel
    
    
    var body: some View {
        NavigationStack{
            List(MockData.appetizers, id: \.id){ appetizer in
                AppetizerListCell(appetizer: appetizer)
                
            }
            .navigationTitle("🌮 Appetizers")
        }
    }
}

#Preview {
    AppetizerListView()
}
