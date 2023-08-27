//
//  HomeViewModel.swift
//  E Commerce App
//
//  Created by Olsera on 23/08/23.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var products = [Product]()
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    init() {
        fetchAllProducts()
    }
    
    func fetchAllProducts() {
        isLoading = true
        errorMessage = nil
        
        let service = APIService()
        let url = URL(string: "https://dummyjson.com/products")
        
        service.fetchProducts(url: url) { [unowned self] result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case.failure(let error):
                    self.errorMessage = error.loacalizedDescription
                    print(error)
                case.success(let products):
                    self.products = products
                }
            }
        }
    }
}
