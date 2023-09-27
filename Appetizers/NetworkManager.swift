//
//  NetworkManager.swift
//  Appetizers
//
//  Created by luis armendariz on 9/24/23.
//

import Foundation

//SINGLETON- initializes class instance single time with static property and share class instance globally.
final class NetworkManager {
    
    static let shared = NetworkManager()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    // endpoint of "appetizers"
    private let appetizerURL = baseURL + "appetizers"
    
    private init() {}
    //Result- A value that represents either a success or a failure, including an associated value in each case
    //@escaping- a reference type which lives in memory that needs to outlive the life of the function
    func getAppetizers(completed: @escaping (Result<[Appetizer], APError>) -> Void) {
        guard let url = URL(string: appetizerURL) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
              if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
                completed(.success(decodedResponse.request))
            }catch {
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
}
