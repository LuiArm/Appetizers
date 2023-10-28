//
//  AppetizerListCell.swift
//  Appetizers
//
//  Created by luis armendariz on 9/24/23.
//

import SwiftUI

struct AppetizerListCell: View {
    let appetizer: Appetizer
    
    var body: some View {
        HStack{
//            AppetizerRemoteImage(urlString: appetizer.imageURL)
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 120,height: 90)
//                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10), style: .continuous))
            
            AsyncImage(url: URL(string: appetizer.imageURL)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 120)
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20), style: .continuous))
            } placeholder: {
                Image("food-placeholder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 120)
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20), style: .continuous))
            }

            VStack(alignment: .leading,spacing: 8){
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                Text("$\(appetizer.price, specifier: "%.2f")")
                    .font(.title3)
                    .foregroundStyle(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
        }
    }
}

#Preview {
    AppetizerListCell(appetizer: MockData.sampleAppetizer)
}
