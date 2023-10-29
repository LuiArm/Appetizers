//
//  LoadingView.swift
//  Appetizers
//
//  Created by luis armendariz on 10/29/23.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack{
            Color(.systemBackground)
                .ignoresSafeArea(.all)
            
            ProgressView()
                .tint(.brandPrimary)
                .scaleEffect(2)
        }
    }
}








#Preview {
    LoadingView()
}
