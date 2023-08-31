//
//  RoundedIconButton.swift
//  E Commerce App
//
//  Created by Olsera on 31/08/23.
//

import SwiftUI

struct RoundedIconButton: View {
    let buttonIcon: String
    let iconSize: CGFloat
    let iconColor: Color
    let bgColor: Color
    
    var body: some View {
        let paddingIcon: CGFloat = iconSize <= 12 ? 4 : (iconSize <= 24 ? 12 : 18)
        HStack(alignment: .center, spacing: 0) {
            Image(systemName: buttonIcon)
                .resizable()
                .scaledToFit()
                .frame(width: iconSize, height: iconSize)
                .foregroundColor(iconColor)
        }
        .padding(paddingIcon)
        .background(bgColor)
        .clipShape(Capsule())
    }
}

struct RoundedIconButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundedIconButton(buttonIcon: "house.fill", iconSize: 24, iconColor: Color(.white), bgColor: Color("primaryApp"))
    }
}
