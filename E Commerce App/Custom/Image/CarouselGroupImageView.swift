//
//  CarouselGroupImageView.swift
//  E Commerce App
//
//  Created by Olsera on 02/09/23.
//

import SwiftUI

struct CarouselGroupImageView: View {
    @State private var selectedImageIndex = 0
    //let images: [String]
    let product: Product
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: product.images[selectedImageIndex])) { phase in
                switch phase {
                case .empty:
                    Color.gray
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 180)
                        .cornerRadius(5)
                case .failure:
                    Color.red
                @unknown default:
                    Color.gray
                }
            }
            
            HStack {
                VStack (spacing: 8){
                    Text(product.title)
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(Color("blackApp"))
                        .frame(alignment: .leading)
                    
                    Text(String(format: "$%.2f", product.price))
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(Color("primaryApp"))
                            .frame(alignment: .leading)
                }
                Spacer()
                
                Button {
                    
                } label: {
                    RoundedIconButton(buttonIcon: "heart.fill", iconSize: 18, iconColor: Color.white, bgColor: Color.pink)
                        .padding(4)
                }
            }
            .padding(.vertical)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(0..<product.images.count, id: \.self) { index in
                        AsyncImage(url: URL(string: product.images[index])) { phase in
                            switch phase {
                            case .empty:
                                Color.gray
                            case .success(let image):
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 55, height: 55)
                                    .cornerRadius(5)
                                    .onTapGesture {
                                        selectedImageIndex = index
                                    }
                                    .padding(2)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(Color("primaryApp").opacity(index == selectedImageIndex ? 1.0 : 0.0), lineWidth: 3)
                                    )
                            case .failure:
                                Color.red
                            @unknown default:
                                Color.gray
                            }
                        }
                    }
                }
            }
        }
        .padding(10)
        .background(Color.white)
        .cornerRadius(10)
    }
}

struct CarouselGroupImageView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselGroupImageView(product: Product.dummyProduct())
    }
}
