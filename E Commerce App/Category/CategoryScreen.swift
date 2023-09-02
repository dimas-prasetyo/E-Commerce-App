//
//  CategoryScreen.swift
//  E Commerce App
//
//  Created by Olsera on 19/08/23.
//

import SwiftUI

struct CategoryScreen: View {
    //@StateObject var viewModel = HomeViewModel()
    @StateObject var viewModel = CategoryViewModel()
    @State var inputText: String = ""
    @State var isShowAllCategories: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack {
                        SearchBar(inputText: $inputText)
                        BoxIconButton(buttonIcon: "cart", iconSize: 24, isSelected: false)
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    
                    Text("You typed: \(inputText)")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(Color("blackApp"))
                    
                    HStack {
                        Text(viewModel.selectedCategory?.code == "all" ? "Category" : "Category \"\(viewModel.selectedCategory?.name ?? "")\"")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(Color("blackApp"))
                            .padding(.horizontal)
                        
                        Spacer()
                        
                        Button {
                            if isShowAllCategories {
                                isShowAllCategories = false
                            } else {
                                isShowAllCategories = true
                            }
                        } label: {
                            Text(isShowAllCategories ? "Hide" : "Show all")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(Color("primaryApp"))
                                .padding(.horizontal)
                        }
                        
                    }
                    if isShowAllCategories {
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHGrid(rows: [GridItem(.fixed(72), spacing: 8), GridItem(.fixed(72), spacing: 8)], spacing: 8) {
                                ForEach(viewModel.categories, id: \.id) { category in
                                    if category.icon.isEmpty {
                                        Button {
                                            viewModel.toggleCategorySelection(category)
                                        } label: {
                                            SquareTextButton(buttonText: category.name, buttonSize: 72, isSelected: category.isSelected)
                                        }
                                    } else {
                                        Button {
                                            viewModel.toggleCategorySelection(category)
                                        } label: {
                                            BoxIconButton(buttonIcon: category.icon, iconSize: 36, isSelected: category.isSelected)
                                        }
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                    } else {
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack(spacing: 8) {
                                ForEach(viewModel.categories.prefix(5), id: \.id) { category in
                                    if category.icon.isEmpty {
                                        Button {
                                            viewModel.toggleCategorySelection(category)
                                        } label: {
                                            SquareTextButton(buttonText: category.name, buttonSize: 72, isSelected: category.isSelected)
                                        }
                                    } else {
                                        Button {
                                            viewModel.toggleCategorySelection(category)
                                        } label: {
                                            BoxIconButton(buttonIcon: category.icon, iconSize: 36, isSelected: category.isSelected)
                                        }
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                
                    
                }
            }
            .background(Color("backgroundApp"))
        }
    }
}

struct CategoryScreen_Previews: PreviewProvider {
    static var previews: some View {
        CategoryScreen()
    }
}
