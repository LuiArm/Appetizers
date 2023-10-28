//
//  NetworkManager.swift
//  Appetizers
//
//  Created by luis armendariz on 9/24/23.
//

import UIKit

//SINGLETON- initializes class instance single time with static property and share class instance globally.
final class NetworkManager {
    
    static let shared = NetworkManager()
    
    //Put images from network call in cache to avoid downloading everytime user scrolls
    private let cache = NSCache<NSString, UIImage>()
                            //  Identifier, Image (Key : Value pair)
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    // endpoint of "appetizers"
    private let appetizerURL = baseURL + "appetizers"
    
    private init() {}
    //Result- A value that represents either a success or a failure, including an associated value in each case
    //@escaping- a reference type which lives in memory that needs to outlive the life of the function
    
//    func getAppetizers(completed: @escaping (Result<[Appetizer], APError>) -> Void) {
//        guard let url = URL(string: appetizerURL) else {
//            completed(.failure(.invalidURL))
//            return
//        }
//        
//        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
//              if let _ = error {
//                completed(.failure(.unableToComplete))
//                return
//            }
//            
//            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//                completed(.failure(.invalidResponse))
//                return
//            }
//            
//            guard let data = data else {
//                completed(.failure(.invalidData))
//                return
//            }
//            
//            
//            do {
//                let decoder = JSONDecoder()
//                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
//                completed(.success(decodedResponse.request))
//            }catch {
//                completed(.failure(.invalidData))
//            }
//        }
//        task.resume()
//    }
    
    func getAppetizers()async throws -> [Appetizer] {
        guard let url = URL(string: appetizerURL) else {
            throw APError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url))
            
            
            do {
                let decoder = JSONDecoder()
                return try decoder.decode(AppetizerResponse.self, from: data).request
            }catch {
                throw APError.invalidData
            }
       
    }

    
    
    
    
    //Network call to get images
    // UIImage is optional because we may not get an image back so we will use a placeholder image in that case
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void ) {
        
        // URL address for each image is unique
        let cacheKey = NSString(string: urlString)
        
        //checking if image is in the cache, if so pull image and return
        if let image = cache.object(forKey: cacheKey){
            completed(image)
            return
        }
        
        //if image is not in cache proceed to download from url
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            //if good data is returned, try to initialize image from that data
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            //Placing image in the cache
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        
        task.resume()
    }
}
