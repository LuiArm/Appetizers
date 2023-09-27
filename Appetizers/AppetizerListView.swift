//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by luis armendariz on 9/22/23.
//

import SwiftUI

struct AppetizerListView: View {
    @State private var appetizers: [Appetizer] = []
    
    
    var body: some View {
        NavigationStack{
            List(appetizers, id: \.id){ appetizer in
                AppetizerListCell(appetizer: appetizer)
                
            }
            .navigationTitle("🌮 Appetizers")
        }
        .onAppear{
            getAppetizers()
        }
    }
    
    func getAppetizers() {
        //On background thread but need to be on main so use Dispatch que main
        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}

#Preview {
    AppetizerListView()
}
