//
//  ProductViewModel.swift
//  BookxpertAssignment
//
//  Created by Tanmay Deo on 19/06/25.
//

import Foundation

class ProductViewModel {
    
    func fetchProducts(urlString : String, completionHandler: @escaping ([ProductModel]) -> Void) {
        APIManager.sharedInstance.fetchResponse(url: "https://api.restful-api.dev/objects", headers: [:], httpMethod: .get) { responseData in
            completionHandler(responseData)
        } failure: { error in
            print(error)
        }
    }
}
