//
//  NetworkManager.swift
//  Appetizers
//
//  Created by luis armendariz on 9/24/23.
//

import Foundation

//SINGLETON- initializes class instance single time with static property and share class instance globally.
final class NetworkManager {
    
    static let shares = NetworkManager()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    // endpoint of "appetizers"
    private let appetizerURL = baseURL + "appetizers"
    
    private init() {}
    //Result- A value that represents either a success or a failure, including an associated value in each case
    //@escaping- a reference type which lives in memory that needs to outlive the life of the function
    func getAppetizers(completed: @escaping (Result<[Appetizer], APError>) -> Void) {
         
    }
}
