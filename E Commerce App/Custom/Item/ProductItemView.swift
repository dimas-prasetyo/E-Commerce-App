//
//  ProductItemView.swift
//  E Commerce App
//
//  Created by Olsera on 28/08/23.
//

import SwiftUI

struct ProductItemView: View {
    @EnvironmentObject var viewModel: HomeViewModel
    @Binding var product: Product
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .topLeading) {
                AsyncImage(url: URL(string: product.thumbnail)) { phase in
                    switch phase {
                    case .empty:
                        Color.gray
                            .frame(width: 160, height: 160)
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 160, height: 160)
                            .cornerRadius(5)
                    case .failure:
                        Color.red
                            .frame(width: 160, height: 160)
                    @unknown default:
                        Color.gray
                            .frame(width: 160, height: 160)
                    }
                }
                
                Button {
                    product.isFavorite.toggle()
                } label: {
                    FavoriteButton(iconSize: 14, isFavorite: product.isFavorite)
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
                    viewModel.addProductCart(product: product)
                } label: {
                    BoxIconButton(buttonIcon: "plus", iconSize: 12, isSelected: true)
                }
            }
            .frame(width: 160)
            .padding(.bottom, 2)
            
        }
        .padding(10)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.secondary.opacity(0.5), radius: 5, x: 5, y: 5)
    }
}

struct ProductItemView_Previews: PreviewProvider {
    static var previews: some View {
        ProductItemView(product:  .constant(Product.dummyProduct()))
            .environmentObject(HomeViewModel())
    }
}
