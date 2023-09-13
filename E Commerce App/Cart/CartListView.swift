//
//  CartListView.swift
//  E Commerce App
//
//  Created by Olsera on 12/09/23.
//

import SwiftUI

struct CartListView: View {
    @EnvironmentObject var mainViewModel: MainViewModel
    @State var isSelected: Bool = false
    var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                BackButton()
                HStack {
                    Spacer()
                    Text("CartList")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(Color("blackApp"))
                    Spacer()
                }
            }
            .padding(.horizontal)
            
            ScrollView {
                VStack {
                    
                    ForEach(mainViewModel.productsInCart.indices, id: \.self) { index in
                        
                        CartItemView(product: $mainViewModel.productsInCart[index], quantity: mainViewModel.getBindingForQuantity(at: index), isSelected: $isSelected)
                        //Text("\(cart)")
                        //Text(product.title)
                        //CartItemView(product: $mainViewModel.productsInCart[index], quantity: $mainViewModel.productCarts[index].quantity ?? .constant(1), isSelected: $mainViewModel.productCarts[index].isSelected)
                    }
                }
                .padding()
            }
            Spacer()
            HStack {
                
            }
            Spacer()
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarBackButtonHidden(true)
        .background(Color("backgroundApp"))
        .onAppear {
            mainViewModel.showFloatingNavbar = false
        }
        .onDisappear {
            mainViewModel.showFloatingNavbar = true
        }
    }
}

struct CartListView_Previews: PreviewProvider {
    static var previews: some View {
        CartListView()
            .environmentObject(MainViewModel())
    }
}
