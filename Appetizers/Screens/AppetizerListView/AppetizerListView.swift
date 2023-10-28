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
                        .listRowSeparator(.hidden)
                        .onTapGesture {
                            viewModel.selectedAppetizer = appetizer
                            viewModel.isShowingDetail = true
                        }
                }
                .navigationTitle("🌮 Appetizers")
                .disabled(viewModel.isShowingDetail)
            }
            .task {
                viewModel.getAppetizers()
            }
            .blur(radius: viewModel.isShowingDetail ? 20 : 0)
            
            if viewModel.isShowingDetail {
                AppetizerDetailView(appetizer: viewModel.selectedAppetizer!, isShowingDetail: $viewModel.isShowingDetail)
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
