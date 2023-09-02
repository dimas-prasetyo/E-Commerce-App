//
//  DetailProductView.swift
//  E Commerce App
//
//  Created by Olsera on 31/08/23.
//

import SwiftUI

struct DetailProductView: View {
    @EnvironmentObject var mainViewModel: MainViewModel
    @StateObject var viewModel = DetailProductViewModel()
    @State private var currentPage = 0
    
    let product: Product
    var body: some View {
        VStack {
            HStack {
                BackButton()
                Spacer()
                Text("Details Product")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(Color("blackApp"))
                Spacer()
                Button {
                    
                } label: {
                    BoxIconButton(buttonIcon: "cart", iconSize: 24, isSelected: false)
                }
            }
            .padding(.horizontal)
            
            ScrollView {
                VStack {
                    CarouselGroupImageView(product: product)
                    let tabItems = TabItem.getDetailProductTabView()
                    CustomTabView(tabItems: tabItems)
                }
            }
            .padding(.horizontal)
            
            HStack {
                Spacer()
                Button {
                    
                } label: {
                    TextButton(buttonText: "Buy now", textColor: Color.white, textSize: 14, bgColor: Color("primaryApp"), icon: nil)
                }
                Spacer()
                
                Button {
                    
                } label: {
                    TextButton(buttonText: "Add to cart", textColor: Color.white, textSize: 14, bgColor: Color("primaryApp"), icon: "plus")
                }
                Spacer()

            }
            .padding(.vertical)
            .background(Color.white)
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarBackButtonHidden(true)
        .background(Color("backgroundApp"))
        .onAppear {
            mainViewModel.showFloatingNavbar = false
            //viewModel.product = product
            viewModel.setProduct(selectedProduct: product)
        }
        .onDisappear {
            mainViewModel.showFloatingNavbar = true
        }
        .environmentObject(viewModel)
        
    }
}

struct DetailProductView_Previews: PreviewProvider {
    static var previews: some View {
        DetailProductView(product: Product.dummyProduct())
            .environmentObject(MainViewModel())
    }
}
