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
                            CartListView()
                        } label: {
                            CartButton(cartItem: $viewModel.productCartCount)
                            //Text("\(viewModel.productWishListCount)")
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    
                    if (inputText.isEmpty) {
                        HStack (alignment: .bottom) {
                            Text("New Arrivals")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(Color("blackApp"))
                            Spacer()
                            
                            Button {
                                
                            } label: {
                                Text("See all")
                                    .font(.system(size: 12))
                                    .foregroundColor(Color("primaryApp"))
                            }
                        }
                        .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack(spacing: 16) {
                                ForEach(viewModel.newProducts.indices, id: \.self) { index in
                                    NavigationLink {
                                        DetailProductView(product: viewModel.products[index])
                                    } label: {
                                        ProductItemView(product: $viewModel.products[index])
                                    }
                                }
                                .padding(.vertical, 4)
                            }
                        }
                        .padding(.horizontal)
                        .padding(.bottom)
                        
                        HStack(alignment: .bottom) {
                            Text("Browse")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(Color("blackApp"))
                            Spacer()
                            Button {
                                
                            } label: {
                                Text("See all")
                                    .font(.system(size: 12))
                                    .foregroundColor(Color("primaryApp"))
                            }
                        }
                        .padding(.horizontal)
                    }
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
            viewModel.fetchNewArrivalsProducts()
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
