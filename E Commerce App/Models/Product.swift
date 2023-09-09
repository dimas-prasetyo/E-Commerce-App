//
//  Product.swift
//  E Commerce App
//
//  Created by Olsera on 19/08/23.
//

import Foundation
import RealmSwift

struct Product: Codable, CustomStringConvertible, Identifiable {
    let id: Int
    let title: String
    let description: String
    let price: Double
    let discountPercentage: Double
    let rating: Double
    let stock: Int
    let brand: String
    let category: String
    let thumbnail: String
    let images: [String]
    var isFavorite: Bool = false
    
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
        case category
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
        category = try values.decode(String.self, forKey: .category)
        thumbnail = try values.decode(String.self, forKey: .thumbnail)
        images = try values.decode([String].self, forKey: .images)
        isFavorite = false
    }
    
    init(id: Int, title: String, description: String, price: Double, discountPercentage: Double, rating: Double, stock: Int, brand: String, category: String, thumbnail: String, images:[String], isFavorite: Bool) {
        self.id = id
        self.title = title
        self.description = description
        self.price = price
        self.discountPercentage = discountPercentage
        self.rating = rating
        self.stock = stock
        self.brand = brand
        self.category = category
        self.thumbnail = thumbnail
        self.images = images
        self.isFavorite = isFavorite
    }
    
    static func dummyProduct() -> Product {
        return Product(
            id: 1,
            title: "iPhone 9",
            description: "An apple mobile which is nothing like apple",
            price: 549,
            discountPercentage: 12.96,
            rating: 4.69,
            stock: 94,
            brand: "Apple",
            category: "smartphones",
            thumbnail: "https://i.dummyjson.com/data/products/1/thumbnail.jpg",
            images: ["https://i.dummyjson.com/data/products/1/1.jpg", "https://i.dummyjson.com/data/products/1/2.jpg", "https://i.dummyjson.com/data/products/1/3.jpg", "https://i.dummyjson.com/data/products/1/4.jpg"],
            isFavorite: false
        )
    }

}
