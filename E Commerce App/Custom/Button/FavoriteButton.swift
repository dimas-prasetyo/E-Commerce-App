//
//  FavoriteButton.swift
//  E Commerce App
//
//  Created by Olsera on 09/09/23.
//

import SwiftUI

struct FavoriteButton: View {
    let iconSize: CGFloat
    let isFavorite: Bool
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            Image(systemName: "heart.fill")
                .resizable()
                .scaledToFit()
                .frame(width: iconSize, height: iconSize)
                .foregroundColor(isFavorite ? Color.white : Color.secondary)
        }
        .padding(12)
        .background(isFavorite ? Color.pink : Color.white)
        .clipShape(Capsule())
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(iconSize: 14, isFavorite: true)
    }
}
