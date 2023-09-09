//
//  CartButton.swift
//  E Commerce App
//
//  Created by Olsera on 09/09/23.
//

import SwiftUI

struct CartButton: View {
    @Binding var cartItem: Int
    
    var body: some View {
        ZStack {
            HStack(alignment: .center, spacing: 0) {
                Image(systemName: "cart")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .foregroundColor(Color("blackApp"))
            }
            .padding(12)
            
            if cartItem > 0 {
                HStack {
                    Text("\(cartItem)")
                        .font(.system(size: 8))
                        .foregroundColor(Color.white)
                }
                .frame(width: 16, height: 16)
                .background(Color("primaryApp"))
                .cornerRadius(8)
                .offset(x: 8, y: -8)
            }
        }
        .background(Color.white)
        .cornerRadius(6)
    }
}

struct CartButton_Previews: PreviewProvider {
    static var previews: some View {
        CartButton(cartItem: .constant(3))
    }
}
