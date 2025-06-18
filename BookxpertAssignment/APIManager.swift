//
//  APIManager.swift
//  BookxpertAssignment
//
//  Created by Tanmay Deo on 19/06/25.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case invalidBody
    case invalidData
    case customError(Error)
    
    var localizedDescription : String {
        switch self {
        case .invalidURL:
            return "The provided URL is not a valid URL"
        case .invalidBody:
            return "The request body could not be serialized into JSON due to improper structrue."
        case .invalidData:
            return "The response data from the server is not proper."
        case .customError(let error):
            return "Custom error : \(error)"
        }
    }
}


