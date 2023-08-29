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
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 16), count: 2), spacing: 16) {
                    ForEach(viewModel.products, id: \.id) { product in
                        NavigationLink {
                            
                        } label: {
                            ProductItemView(product: product)
                        }
                    }
                }
                .padding()
            }
            .background(Color("backgroundApp"))
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
