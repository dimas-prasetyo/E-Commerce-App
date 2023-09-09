//
//  HomeScreen.swift
//  E Commerce App
//
//  Created by Olsera on 19/08/23.
//

import SwiftUI
import Combine

struct HomeScreen: View {
    @StateObject var viewModel = HomeViewModel()
    @State var inputText: String = ""
    //@Binding var cartItem: Int
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    HStack {
                        SearchBar(inputText: $inputText)
                        NavigationLink {
                            
                        } label: {
                            CartButton(cartItem: $viewModel.productCartCount)
                            //Text("\(viewModel.productWishListCount)")
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    
                    ForEach(viewModel.products.indices, id: \.self) { index in
                        NavigationLink {
                            DetailProductView(product: viewModel.products[index])
                        } label: {
                            ProductItemLandView(product: $viewModel.products[index])
                        }
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 5)
                    
                }
            }
            .background(Color("backgroundApp"))
        }
        .onAppear{
            viewModel.fetchAllProducts()
        }
        .onChange(of: inputText) { newValue in
            if !newValue.isEmpty {
                viewModel.searchProduct(query: newValue)
            } else {
                viewModel.fetchAllProducts()
            }
        }
        .environmentObject(viewModel)
    }
    
    struct HomeScreen_Previews: PreviewProvider {
        static var previews: some View {
            HomeScreen()
        }
    }
}
