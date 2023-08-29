//
//  TextButton.swift
//  E Commerce App
//
//  Created by Olsera on 29/08/23.
//

import SwiftUI

struct TextButton: View {
    let buttonText: String
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            Text(buttonText)
                .font(.system(size: 12, weight: .semibold))
                .foregroundColor(Color.white)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 8)
        .background(Color("primaryApp"))
        .cornerRadius(6)
    }
}

struct TextButton_Previews: PreviewProvider {
    static var previews: some View {
        TextButton(buttonText: "Add item")
    }
}
