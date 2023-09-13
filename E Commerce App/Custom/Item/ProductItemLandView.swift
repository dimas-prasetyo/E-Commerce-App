//
//  ProductItemLandView.swift
//  E Commerce App
//
//  Created by Olsera on 31/08/23.
//

import SwiftUI

struct ProductItemLandView: View {
    @EnvironmentObject var viewModel: HomeViewModel
    @Binding var product: Product
    
    var body: some View {
        HStack {
            ZStack(alignment: .topLeading) {
                AsyncImage(url: URL(string: product.thumbnail)) { phase in
                    switch phase {
                    case .empty:
                        Color.gray
                            .frame(width: 120, height: 120)
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 120, height: 120)
                            .cornerRadius(5)
                    case .failure:
                        Color.red
                            .frame(width: 120, height: 120)
                    @unknown default:
                        Color.gray
                            .frame(width: 120, height: 120)
                    }
                }
                
                Button {
                    product.isFavorite.toggle()
                } label: {
                    FavoriteButton(iconSize: 14, isFavorite: product.isFavorite)
                }
            }
            
            VStack(alignment: .leading, spacing: 2) {
                Text(product.category)
                    .font(.system(size: 12))
                    .foregroundColor(Color.secondary)
                
                Text(product.title)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(Color("blackApp"))
                
                Text(product.description)
                    .font(.system(size: 12))
                    .foregroundColor(Color.secondary)
                    .frame(alignment: .leading)
                Spacer()
                
                
                HStack {
                    Text(String(format: "$%.2f", product.price))
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(Color("blackApp"))
                    
                    Spacer()
                    
                    Button {
                        viewModel.addProductCart(product: product)
                    } label: {
                        TextButton(buttonText: "Add to cart", textColor: Color.white, textSize: 12, bgColor: Color("primaryApp"), icon: "plus")
                    }
                }
                .padding(.bottom, 2)
                
            }
            .frame(height: 120)
            Spacer()
        }
        .padding(10)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.secondary.opacity(0.5), radius: 5, x: 5, y: 5)
    }
}

struct ProductItemLandView_Previews: PreviewProvider {
    static var previews: some View {
        ProductItemLandView(product: .constant(Product.dummyProduct()))
            .environmentObject(HomeViewModel())
    }
}
