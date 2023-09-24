//
//  Appetizer.swift
//  Appetizers
//
//  Created by luis armendariz on 9/23/23.
//

import Foundation

//Decodable decodes json into struct, encodable is when you need manipulate data and send it back to server
struct Appetizer: Decodable, Identifiable {
    // Make them lets if only reading data, make them vars if updating data and sending back
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let carbs: Int
    let calories: Int
    let protein: Int
    
    }

struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

struct MockData {
    static let sampleAppetizer = Appetizer(id: 0001,
                                           name: "Test Appetizer",
                                           description: "This is my test... Thihs is my test...This is my test... This is my test.... This is my test....",
                                           price: 99.99,
                                           imageURL: "",
                                           carbs: 123,
                                           calories: 200,
                                           protein: 100)
    
    static let appetizers = [sampleAppetizer,sampleAppetizer,sampleAppetizer,sampleAppetizer]
}
