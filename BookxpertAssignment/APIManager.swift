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

enum HTTPMethod : String {
    case get = "GET"
    case post = "POST"
}

final class APIManager {
    
    static let sharedInstance : APIManager = APIManager()
    private init() {
    }
    
    func fetchResponse(url: String,headers: [String: String],httpMethod: HTTPMethod, success: @escaping (_ responseData: [ProductModel]) -> Void,failure: @escaping (_ error: APIError) -> Void) {
        
        guard let apiURL = URL(string: url) else {
            return
        }
        
        var urlRequest = URLRequest(url: apiURL)
        urlRequest.allHTTPHeaderFields = headers
        urlRequest.httpMethod = httpMethod.rawValue
        
        let task = URLSession(configuration: .default).dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                failure(.customError(error))
                return
            }
            
            guard let data = data else {
                failure(.invalidData)
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode([ProductModel].self, from: data)
                success(decodedData)
            } catch {
                print("Decoding Error: \(error)")
                failure(.customError(error))
            }
            
        }
        task.resume()
        
    }
}
