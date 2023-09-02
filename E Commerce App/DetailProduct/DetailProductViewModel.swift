//
//  DetailProductViewModel.swift
//  E Commerce App
//
//  Created by Olsera on 02/09/23.
//

import Foundation

class DetailProductViewModel: ObservableObject {
    //@Published var product: Product? = nil
    @Published var product: Product = Product.dummyProduct()
    
    func setProduct(selectedProduct: Product) {
        product = selectedProduct
    }
}
