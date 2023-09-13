//
//  CartItemView.swift
//  E Commerce App
//
//  Created by Olsera on 12/09/23.
//

import SwiftUI

struct CartItemView: View {
    @Binding var product: Product
    @Binding var quantity: Int
    @Binding var isSelected: Bool
    
    var body: some View {
        HStack {
            VStack {
                HStack {
                    CheckBox(isChecked: $isSelected)
                    
                    AsyncImage(url: URL(string: product.thumbnail)) { phase in
                        switch phase {
                        case .empty:
                            Color.gray
                                .frame(width: 70, height: 70)
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 70, height: 70)
                                .cornerRadius(5)
                        case .failure:
                            Color.red
                                .frame(width: 70, height: 70)
                        @unknown default:
                            Color.gray
                                .frame(width: 70, height: 70)
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text(product.title)
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(Color("blackApp"))
                        
                        Text(product.category)
                            .font(.system(size: 12))
                            .foregroundColor(Color.secondary)
                        Text(String(format: "$%.2f", product.price))
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(Color("blackApp"))
                        
                    }
                    Spacer()
                }
                HStack {
                    Spacer()
                    UnInputableStepper(input: $quantity)
                }
            }
            Spacer()
        }
    }
}

struct CartItemView_Previews: PreviewProvider {
    static var previews: some View {
        CartItemView(product: .constant(Product.dummyProduct()), quantity: .constant(1), isSelected: .constant(true))
    }
}
