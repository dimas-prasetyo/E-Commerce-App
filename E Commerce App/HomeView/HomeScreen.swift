//
//  HomeScreen.swift
//  E Commerce App
//
//  Created by Olsera on 19/08/23.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject var viewModel = HomeViewModel()
    @State var inputText: String = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    HStack {
                        SearchBar(inputText: $inputText)
                        BoxIconButton(buttonIcon: "cart", iconSize: 24, isSelected: false)
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    
                    ForEach(viewModel.products, id: \.id) { product in
                        NavigationLink {
                            DetailProductView(product: product)
                        } label: {
                            ProductItemLandView(product: product)
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
    }
    
    struct HomeScreen_Previews: PreviewProvider {
        static var previews: some View {
            HomeScreen()
        }
    }
}
