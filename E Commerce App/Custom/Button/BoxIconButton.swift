//
//  BoxIconButton.swift
//  E Commerce App
//
//  Created by Olsera on 29/08/23.
//

import SwiftUI

struct BoxIconButton: View {
    let buttonIcon: String
    let iconSize: CGFloat
    let isSelected: Bool
    
    var body: some View {
        let paddingIcon: CGFloat = iconSize <= 24 ? 12 : 18
        HStack(alignment: .center, spacing: 0) {
            Image(systemName: buttonIcon)
                .resizable()
                .scaledToFit()
                .frame(width: iconSize, height: iconSize)
                .foregroundColor(isSelected ? Color.white : Color("blackApp"))
        }
        .padding(paddingIcon)
        .background(isSelected ? Color("primaryApp") : Color.white)
        .cornerRadius(6)
    }
}

struct BoxIconButton_Previews: PreviewProvider {
    static var previews: some View {
        BoxIconButton(buttonIcon: "house.fill", iconSize: 24, isSelected: true)
    }
}
