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
        VStack(alignment: .leading) {
            ZStack(alignment: .topLeading) {
                AsyncImage(url: URL(string: product.thumbnail)) { phase in
                    switch phase {
                    case .empty:
                        Color.gray
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 160, height: 160)
                            .cornerRadius(5)
                    case .failure:
                        Color.red
                    @unknown default:
                        Color.gray
                    }
                }
                
                Button {
                    
                } label: {
                    RoundedIconButton(buttonIcon: "heart.fill", iconSize: 14, iconColor: Color.white, bgColor: Color.pink)
                        .padding(4)
                }
            }
            
            Text(product.title)
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(Color("blackApp"))
                .frame(width: 160, alignment: .leading)
            
            
            Text(product.category)
                .font(.system(size: 12))
                .foregroundColor(.secondary)
                .frame(width: 160, alignment: .leading)
            
            HStack {
                Text(String(format: "$%.2f", product.price))
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(Color("blackApp"))
                
                Spacer()
                
                Button {
                    
                } label: {
                    BoxIconButton(buttonIcon: "plus", iconSize: 12, isSelected: true)
                }
            }
            .frame(width: 160)
            .padding(.bottom, 2)
            
//            HStack {
//                ForEach(0..<5) { index in
//                    Image(systemName: index < Int(product.rating) ? "star.fill" : "star")
//                        .foregroundColor(.yellow)
//                }
//            }
        }
        .padding(10)
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
