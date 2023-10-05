//
//  APButton.swift
//  Appetizers
//
//  Created by luis armendariz on 10/4/23.
//

import SwiftUI

struct APButton: View {
    
    let title: LocalizedStringKey
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .foregroundStyle(.white)
            .background(Color.brandPrimary)
            .clipShape(Capsule())

    }
}

#Preview {
    APButton(title: "Test title")
}
