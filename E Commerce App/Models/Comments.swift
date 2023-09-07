//
//  Comments.swift
//  E Commerce App
//
//  Created by Olsera on 06/09/23.
//

import Foundation

struct Comments: Codable, CustomStringConvertible {
    let comments: [Comment]
    let total: Int
    let skip: Int
    let limit: Int
    
    var description: String {
        return "getProducts"
    }
    
    enum CodingKeys: String, CodingKey {
        case comments
        case total
        case skip
        case limit
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //self.products = try container.decodeIfPresent([Product].self, forKey: .products)
        self.comments = try container.decode([Comment].self, forKey: .comments)
    
        self.total = try container.decode(Int.self, forKey: .total)
        self.skip = try container.decode(Int.self, forKey: .skip)
        self.limit = try container.decode(Int.self, forKey: .limit)
    }
}
