//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by luis armendariz on 10/3/23.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    // To use this property wrapper have to make sure there is an 'order' object in the environment
    @EnvironmentObject var order: Order
    
    let appetizer: Appetizer
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        
        VStack{
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 225)
            
            VStack{
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                HStack(spacing: 40){
                    
                    NutrionInfo(title: "Calories", value: appetizer.calories)
            
                    NutrionInfo(title: "Carbs", value: appetizer.carbs)
                    
                    NutrionInfo(title: "Protein", value: appetizer.protein)
                }
            }
            
            Spacer()
            
            Button{
                order.items.append(appetizer)
                isShowingDetail = false
            }label: {
                APButton(title: "$\(appetizer.price, specifier: "%.2f") - Add to Order")
            }
            .padding(.bottom, 30)
        }
        .frame(width: 300,height: 535)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button{
            isShowingDetail = false
        }label: {
            XDismissButton()
        }, alignment: .topTrailing)
    }
}




struct NutrionInfo: View {
    let title: String
    let value: Int
    
    var body: some View{
        VStack(spacing: 5){
            Text(title)
                .bold()
                .font(.caption)
            
            Text("\(value)")
                .foregroundStyle(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}












#Preview {
    AppetizerDetailView(appetizer: MockData.sampleAppetizer, isShowingDetail: .constant(true))
}
