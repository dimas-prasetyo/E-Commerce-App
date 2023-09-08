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
    @Published var comments = [Comment]()
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    func setProduct(selectedProduct: Product) {
        product = selectedProduct
    }
    
    var originalPrice: Double {
//        if let product = product {
//            let originalPrice = product.price / ((100 - product.discountPercentage) / 100)
//            return originalPrice
//        } else {
//            return 0.0
//        }
        
        let originalPrice = product.price / ((100 - product.discountPercentage) / 100)
        return originalPrice
    }
    
    func fetchProductComments(producttId: String) {
        isLoading = true
        errorMessage = nil

        let service = APIService()
        let url = URL(string: "https://dummyjson.com/comments/post/\(producttId)")

        service.fetch([Comment].self, url: url) { [unowned self] (result: Result<[Comment], APIError>) in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case.failure(let error):
                    print(error)
                    self.errorMessage = error.loacalizedDescription
                    print(error)
                case.success(let comments):
                    self.comments = comments
                }
            }
        }
    }
    
    func transformValueIdProduct(_ value: Int) -> String {
        if value < 100 {
            return String(value)
        } else {
            let remainder = (value - 1) % 100
            return String(remainder + 1)
        }
    }
}
