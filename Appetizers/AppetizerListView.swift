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
                HStack{
                    Image("asian-flank-steak")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 120,height: 90)
                        .clipShape(Capsule())
        
                    VStack{
                        Text(appetizer.name)
                        Text("$\(appetizer.price)")
                        
                    }
                }
                
            }
            .navigationTitle("🌮 Appetizers")
        }
    }
}

#Preview {
    AppetizerListView()
}
