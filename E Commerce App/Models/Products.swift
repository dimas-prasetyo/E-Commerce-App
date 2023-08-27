//
//  Products.swift
//  E Commerce App
//
//  Created by Olsera on 19/08/23.
//

import Foundation


struct Products: Codable, CustomStringConvertible {
    
    //let products: [Product]?
    let products: [Product]
    let total: Int
    let skip: Int
    let limit: Int
    
    var description: String {
        return "getProducts"
    }
    
    enum CodingKeys: String, CodingKey {
        case products
        case total
        case skip
        case limit
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // decodeIfPresent digunakan apabila ada kemungkinan value null
        //self.products = try container.decodeIfPresent([Product].self, forKey: .products)
        
        self.products = try container.decode([Product].self, forKey: .products)
    
        self.total = try container.decode(Int.self, forKey: .total)
        self.skip = try container.decode(Int.self, forKey: .skip)
        self.limit = try container.decode(Int.self, forKey: .limit)
    }
}

