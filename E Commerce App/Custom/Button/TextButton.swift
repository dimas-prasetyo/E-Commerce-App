//
//  TextButton.swift
//  E Commerce App
//
//  Created by Olsera on 29/08/23.
//

import SwiftUI

struct TextButton: View {
    let buttonText: String
    let textColor: Color
    let textSize: CGFloat
    let bgColor: Color
    let icon: String?
    
    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            if icon != nil {
                if let unwrappedIcon = icon {
                    Image(systemName: unwrappedIcon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 12, height: 12)
                        .foregroundColor(textColor)
                }
            }
            
            Text(buttonText)
                .font(.system(size: textSize, weight: .semibold))
                .foregroundColor(textColor)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 8)
        .background(bgColor)
        .cornerRadius(6)
    }
}

struct TextButton_Previews: PreviewProvider {
    static var previews: some View {
        TextButton(buttonText: "Add item", textColor: Color.white, textSize: 12, bgColor: Color("primaryApp"), icon: "plus")
    }
}
