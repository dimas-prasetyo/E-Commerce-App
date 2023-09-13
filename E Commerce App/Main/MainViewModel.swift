//
//  MainViewModel.swift
//  E Commerce App
//
//  Created by Olsera on 01/09/23.
//

import Foundation
import RealmSwift
import SwiftUI

class MainViewModel: ObservableObject {
    @Published var showFloatingNavbar: Bool = true
    @Published var productCartCount: Int = 0
    @Published var productsInCart = [Product]()
    
    private var realm: Realm
    @Published var productCarts: Results<ItemCart>?
    
    init() {
        do {
            realm = try Realm()
            productCarts = realm.objects(ItemCart.self)
            // tambahkan fungsi untuk menambahkan product ke productsInCart
            productCartCount = productCarts?.count ?? 0
            initializeProductsInCart()
        } catch {
            fatalError("Failed to initialize Realm: \(error.localizedDescription)")
        }
    }
    
    func getProductdetails(producttId: Int, completion: @escaping (Product?) -> Void) {
        let service = APIService()
        let url = URL(string: "https://dummyjson.com/products/\(producttId)")

        service.fetchProduct(url: url) { result in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print(error)
                    completion(nil) // Jika terjadi kesalahan, kembalikan nil
                case .success(let product):
                    completion(product) // Kembalikan produk yang berhasil diambil
                }
            }
        }
    }
    
    private func initializeProductsInCart() {
        productsInCart.removeAll() // Hapus semua produk yang ada, jika ada
        
        // Iterasi melalui productCarts dan dapatkan produk untuk setiap item di cart
        
        // Unwrap productCarts karena tipe datanya adalah Results<ItemCart>?
        if let productCarts = productCarts {
                // Iterasi melalui productCarts dan dapatkan produk untuk setiap item di cart
                for item in productCarts {
                    getProductdetails(producttId: item.productId) { [weak self] product in
                        if let product = product {
                            self?.productsInCart.append(product)
                        }
                    }
                }
            }
    }
    
    func getBindingForQuantity(at index: Int) -> Binding<Int> {
        Binding(
            get: {
                return self.productCarts?[index].quantity ?? 0
            },
            set: { newValue in
                if let itemCart = self.productCarts?[index] {
                    try? self.realm.write {
                        itemCart.quantity = newValue
                    }
                }
            }
        )
    }
}
