//
//  TabItem.swift
//  E Commerce App
//
//  Created by Olsera on 02/09/23.
//

import Foundation
import SwiftUI

struct TabItem {
    var title: String
    var iconName: String?
    var content: AnyView
    
    static func getDetailProductTabView(comments: [Comment]) -> [TabItem] {
        return [
        TabItem(title: "Details Product", iconName: nil, content: AnyView(DetailsProductScreen())),
        TabItem(title: "Product Reviews", iconName: nil, content: AnyView(DetailReviewsScreen(comments: comments)))]
    }
}
