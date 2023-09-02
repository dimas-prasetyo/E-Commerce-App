//
//  HomeScreen.swift
//  E Commerce App
//
//  Created by Olsera on 19/08/23.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
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
//                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 16), count: 2), spacing: 16) {
//                    ForEach(viewModel.products, id: \.id) { product in
//                        NavigationLink {
//                            DetailProductView(product: product)
//                        } label: {
//                            ProductItemView(product: product)
//                        }
//                    }
//                    .padding()
//                }
            }
            .background(Color("backgroundApp"))
        }
    }
    
    struct HomeScreen_Previews: PreviewProvider {
        static var previews: some View {
            HomeScreen()
                .environmentObject(HomeViewModel())
        }
    }
}
