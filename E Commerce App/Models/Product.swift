//
//  Product.swift
//  E Commerce App
//
//  Created by Olsera on 19/08/23.
//

import Foundation

struct Product: Codable {
    
    let id: Int
    let title: String
    let description: String
    let price: Double
    let discountPercentage: Double
    let rating: Double
    let stock: Int
    let brand: String
    let categroy: String
    let thumbnail: String
    let images: [String]
    
//    var description: String {
//        return ""
//    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case price
        case discountPercentage
        case rating
        case stock
        case brand
        case categroy
        case thumbnail
        case images
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try values.decode(Int.self, forKey: .id)
        title = try values.decode(String.self, forKey: .title)
        description = try values.decode(String.self, forKey: .description)
        price = try values.decode(Double.self, forKey: .price)
        discountPercentage  = try values.decode(Double.self, forKey: .discountPercentage)
        rating = try values.decode(Double.self, forKey: .rating)
        stock = try values.decode(Int.self, forKey: .stock)
        brand = try values.decode(String.self, forKey: .brand)
        categroy = try values.decode(String.self, forKey: .categroy)
        thumbnail = try values.decode(String.self, forKey: .thumbnail)
        images = try values.decode([String].self, forKey: .images)
    }
}
