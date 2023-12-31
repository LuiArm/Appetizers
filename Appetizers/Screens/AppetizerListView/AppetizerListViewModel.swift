//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by luis armendariz on 9/27/23.
//

import Foundation


final class AppetizerListViewModel: ObservableObject {
    @Published  var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetail = false
    @Published var selectedAppetizer: Appetizer?
    
//    func getAppetizers() {
//        isLoading = true
//        //On background thread but need to be on main so use Dispatch que main
//        NetworkManager.shared.getAppetizers { [self] result in
//            DispatchQueue.main.async {
//                isLoading = false
//                switch result {
//                case .success(let appetizers):
//                    self.appetizers = appetizers // still need self here to differ from the same named appetizers
//                    
//                case .failure(let error): //error passed in from network manager
//                    switch error {
//                    case .invalidResponse:
//                        alertItem = AlertContext.invalidResponse
//                        
//                    case .invalidURL:
//                        alertItem = AlertContext.invalidURL
//                        
//                    case .invalidData:
//                        alertItem = AlertContext.invalidData
//                        
//                    case .unableToComplete:
//                        alertItem = AlertContext.unableToComplete
//                    }
//                }
//            }
//        }
//    }
    
    
    func getAppetizers() {
        isLoading = true
        //On background thread but need to be on main so use Dispatch que main
        Task {
            do {
                appetizers = try await NetworkManager.shared.getAppetizers()
                isLoading = false
            }catch {
                if let apError = error as? APError {
                    switch apError {
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                } else {
                    alertItem = AlertContext.invalidResponse
                }
                isLoading = false
            }
        }
    }
}
