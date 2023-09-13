//
//  HomeViewModel.swift
//  E Commerce App
//
//  Created by Olsera on 23/08/23.
//

import Foundation
import RealmSwift

class HomeViewModel: ObservableObject {
    @Published var showFloatingNavbar: Bool = true
    @Published var products = [Product]()
    @Published var newProducts = [Product]()
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    @Published var productCartCount: Int = 0
    
//    init() {
//        fetchAllProducts()
//    }
    private var realm: Realm
    @Published var productCarts: Results<ItemCart>?

    init() {
        do {
            realm = try Realm()
            productCarts = realm.objects(ItemCart.self)
            productCartCount = productCarts?.count ?? 0
        } catch {
            fatalError("Failed to initialize Realm: \(error.localizedDescription)")
        }
    }
    
    func fetchAllProducts() {
        isLoading = true
        errorMessage = nil

        let service = APIService()
        let url = URL(string: "https://dummyjson.com/products?limit=100")

        service.fetchProducts(url: url) { [unowned self] result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case.failure(let error):
                    print(error)
                    self.errorMessage = error.loacalizedDescription
                    print(error)
                case.success(let products):
                    self.products = products
                }
            }
        }
    }
    
    func fetchNewArrivalsProducts() {
        let service = APIService()
        let url = URL(string: "https://dummyjson.com/products/category/furniture")

        service.fetchProducts(url: url) { [unowned self] result in
            DispatchQueue.main.async {
                //self.isLoading = false
                switch result {
                case.failure(let error):
                    print(error)
                case.success(let products):
                    self.newProducts = products
                }
            }
        }
    }
    
    func searchProduct(query: String) {
        isLoading = true
        errorMessage = nil

        let service = APIService()
        let url = URL(string: "https://dummyjson.com/products/search?q=\(query)")
        
        service.fetchProducts(url: url) { [unowned self] result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case.failure(let error):
                    print(error)
                    self.errorMessage = error.loacalizedDescription
                    print(error)
                case.success(let products):
                    self.products = products
                }
            }
        }
        
    }
    
    func addProductCart(product: Product) {
        if let itemCart = getProductFromDatabase(productId: product.id) {
                try? realm.write {
                    itemCart.quantity += 1
                    itemCart.amountPrice = Double(itemCart.quantity) * product.price
                }
            } else {
                let newItemCart = ItemCart()
                newItemCart.productId = product.id
                newItemCart.quantity = 1
                newItemCart.amountPrice = product.price
                newItemCart.isSelected = false
                
                do {
                    try realm.write {
                        realm.add(newItemCart)
                    }
                } catch {
                    fatalError("Failed to add task: \(error.localizedDescription)")
                }
            }
            productCartCount = productCarts?.count ?? 0
    }
    
    
    func getProductFromDatabase(productId: Int) -> ItemCart? {
        return realm.objects(ItemCart.self).filter("productId == %@", productId).first
    }
}
