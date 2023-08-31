//
//  DetailProductView.swift
//  E Commerce App
//
//  Created by Olsera on 31/08/23.
//

import SwiftUI

struct DetailProductView: View {
    let product: Product
    var body: some View {
        AsyncImage(url: URL(string: product.thumbnail)) { phase in
            switch phase {
            case .empty:
                Color.gray
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 160)
                    .cornerRadius(5)
            case .failure:
                Color.red
            @unknown default:
                Color.gray
            }
        }
    }
}

struct DetailProductView_Previews: PreviewProvider {
    static var previews: some View {
        DetailProductView(product: Product.dummyProduct())
    }
}
