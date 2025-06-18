//
//  ProductModel.swift
//  BookxpertAssignment
//
//  Created by Tanmay Deo on 19/06/25.
//

import Foundation

struct ProductModel : Decodable {
    let id : String?
    let name : String?
    let data : ProductData?
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case name = "name"
        case data = "data"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        data = try values.decodeIfPresent(ProductData.self, forKey: .data)
    }
    
}

struct ProductData : Decodable {
    let color : String?
    let capacity : String?
    
    enum CodingKeys: String, CodingKey {
        
        case color = "color"
        case capacity = "capacity"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        color = try values.decodeIfPresent(String.self, forKey: .color)
        capacity = try values.decodeIfPresent(String.self, forKey: .capacity)
    }
    
}
