//
//  Category.swift
//  E Commerce App
//
//  Created by Olsera on 30/08/23.
//

import Foundation

struct Category: Identifiable {
    var id: Int
    var name: String
    var code: String
    var icon: String
    var isSelected: Bool
    
    init(id: Int, name: String, code: String, icon: String, isSelected: Bool) {
        self.id = id
        self.name = name
        self.code = code
        self.icon = icon
        self.isSelected = isSelected
    }
    
}
