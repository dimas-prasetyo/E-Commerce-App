//
//  SquareTextButton.swift
//  E Commerce App
//
//  Created by Olsera on 29/08/23.
//

import SwiftUI

struct SquareTextButton: View {
    let buttonText: String
    let buttonSize: CGFloat
    let isSelected: Bool
    var body: some View {
    
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: buttonSize, height: buttonSize)
                .background(isSelected ? Color("primaryApp") : Color.white)
                .cornerRadius(12)
            
            Text(buttonText)
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(isSelected ? Color.white : Color("blackApp"))
        }
    }
}

struct SquareTextButton_Previews: PreviewProvider {
    static var previews: some View {
        SquareTextButton(buttonText: "All", buttonSize: 72, isSelected: true)
    }
}
