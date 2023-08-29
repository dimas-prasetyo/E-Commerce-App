//
//  ProductItemView.swift
//  E Commerce App
//
//  Created by Olsera on 28/08/23.
//

import SwiftUI

struct ProductItemView: View {
    let product: Product
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            AsyncImage(url: URL(string: product.thumbnail)) { phase in
                switch phase {
                case .empty:
                    Color.gray
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 120)
                case .failure:
                    Color.red
                @unknown default:
                    Color.gray
                }
            }
            
            Text(product.title)
                .font(.headline)
                .foregroundColor(.primary)
            
            Text(String(format: "$%.2f", product.price))
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            HStack {
                ForEach(0..<5) { index in
                    Image(systemName: index < Int(product.rating) ? "star.fill" : "star")
                        .foregroundColor(.yellow)
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 4)
    }
}

struct ProductItemView_Previews: PreviewProvider {
    static var previews: some View {
        ProductItemView(product: Product.dummyProduct())
    }
}
