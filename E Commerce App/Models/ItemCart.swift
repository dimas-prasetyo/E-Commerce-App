//
//  ItemCart.swift
//  E Commerce App
//
//  Created by Olsera on 09/09/23.
//

import Foundation
import RealmSwift

class ItemCart: Object, Identifiable {
    
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var productId: Int
    @Persisted var quantity: Int
    @Persisted var amountPrice: Double
    @Persisted var isSelected: Bool
    
    override class func primaryKey() -> String? {
        "id"
    }
}
