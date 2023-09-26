//
//  APError.swift
//  Appetizers
//
//  Created by luis armendariz on 9/25/23.
//

import Foundation

// custom errors 
enum APError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
}
