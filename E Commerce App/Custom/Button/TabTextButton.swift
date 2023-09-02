//
//  TabTextButton.swift
//  E Commerce App
//
//  Created by Olsera on 02/09/23.
//

import SwiftUI

struct TabTextButton: View {
    let text: String
    let isSelected: Bool
    
    var body: some View {
        
        HStack(alignment: .center, spacing: 8) {
            Spacer()
            Text(text)
                .font(.system(size: 12, weight: .semibold))
                .foregroundColor(isSelected ? Color("primaryApp") : Color("blackApp"))
            
            Spacer()
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 8)
        .background(isSelected ? Color("primaryForeground") : Color.white)
        .cornerRadius(6)
    }
}

struct TabTextButton_Previews: PreviewProvider {
    static var previews: some View {
        TabTextButton(text: "Detail", isSelected: true)
    }
}
