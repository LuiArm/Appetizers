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
    static let appetizerURL = baseURL + "appetizers"
    
    private init() {}
    
    func getAppetizers(completed: @escaping (Result<[Appetizer], Error>) -> Void) {
         
    }
}
