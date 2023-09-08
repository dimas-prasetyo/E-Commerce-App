//
//  CategoryViewModel.swift
//  E Commerce App
//
//  Created by Olsera on 30/08/23.
//

import Foundation

class CategoryViewModel: ObservableObject {
    @Published var categories = [Category]()
    //@Published var selectedCategory: Category?
    @Published var products = [Product]()
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    
    @Published var selectedCategory: Category? {
        didSet {
            if let newCategory = selectedCategory {
                if newCategory.code != "all" {
                    getProductByCategory()
                } else {
                    fetchAllProducts()
                }
            }
        }
    }
    
    
    func allCategories() -> [Category] {
        return [
            Category(id: 1, name: "All", code: "all", icon: "", isSelected: false),
            Category(id: 2, name: "Laptops", code: "laptops", icon: "laptopcomputer", isSelected: false),
            Category(id: 3, name: "Fragrances", code: "fragrances", icon: "leaf", isSelected: false),
            Category(id: 4, name: "Skincare", code: "skincare", icon: "face.smiling", isSelected: false),
            Category(id: 5, name: "Groceries", code: "groceries", icon: "cart", isSelected: false),
            Category(id: 6, name: "Home Decoration", code: "home-decoration", icon: "house", isSelected: false),
            Category(id: 7, name: "Furniture", code: "furniture", icon: "couch", isSelected: false),
            Category(id: 8, name: "Tops", code: "tops", icon: "tshirt", isSelected: false),
            Category(id: 9, name: "Women's Dresses", code: "womens-dresses", icon: "dress", isSelected: false),
            Category(id: 10, name: "Women's Shoes", code: "womens-shoes", icon: "ladybug", isSelected: false),
            Category(id: 11, name: "Men's Shirts", code: "mens-shirts", icon: "person", isSelected: false),
            Category(id: 12, name: "Men's Shoes", code: "mens-shoes", icon: "man", isSelected: false),
            Category(id: 13, name: "Men's Watches", code: "mens-watches", icon: "clock", isSelected: false),
            Category(id: 14, name: "Women's Watches", code: "womens-watches", icon: "clock.fill", isSelected: false),
            Category(id: 15, name: "Women's Bags", code: "womens-bags", icon: "bag", isSelected: false),
            Category(id: 16, name: "Women's Jewellery", code: "womens-jewellery", icon: "jewelry", isSelected: false),
            Category(id: 17, name: "Sunglasses", code: "sunglasses", icon: "eyeglasses", isSelected: false),
            Category(id: 18, name: "Automotive", code: "automotive", icon: "car", isSelected: false),
            Category(id: 19, name: "Motorcycle", code: "motorcycle", icon: "motorcycle", isSelected: false),
            Category(id: 20, name: "Lighting", code: "lighting", icon: "lightbulb", isSelected: false)
        ]
    }
//    Fungsi ini bisa digunakan untuk multiple select
//    func toggleCategorySelection(_ category: Category) {
//        if let index = categories.firstIndex(where: { $0.id == category.id }) {
//            categories[index].isSelected.toggle()
//        }
//    }
    
    func toggleCategorySelection(_ category: Category) {
        if let index = categories.firstIndex(where: { $0.id == category.id }) {
            selectedCategory = categories[index]
            
            categories.indices.forEach { i in
                categories[i].isSelected = false
            }
            categories[index].isSelected = true
        }
    }
    
    func getProductByCategory() {
        isLoading = true
        errorMessage = nil

        let service = APIService()
        let url = URL(string: "https://dummyjson.com/products/category/\(selectedCategory?.name ?? "")")
        
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
}
