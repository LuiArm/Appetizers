//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by luis armendariz on 9/22/23.
//

import SwiftUI

struct AppetizerListView: View {
    //Initializing state object
    @StateObject var viewModel = AppetizerListViewModel()
    
    
    
    var body: some View {
        ZStack{
            NavigationStack{
                List(viewModel.appetizers, id: \.id){ appetizer in
                    AppetizerListCell(appetizer: appetizer)
                    
                }
                .navigationTitle("🌮 Appetizers")
            }
            .onAppear{
                viewModel.getAppetizers()
            }
            if viewModel.isLoading {
                ProgressView()
                    
            }
        }
        .alert(item: $viewModel.alertItem){alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton )
        }
    }
}

#Preview {
    AppetizerListView()
}
