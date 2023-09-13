//
//  SearchBar.swift
//  E Commerce App
//
//  Created by Olsera on 30/08/23.
//

import SwiftUI

struct SearchBar: View {
    @Binding var inputText: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .frame(width: 24, height: 24)
                .padding(.vertical, 14)
            
            TextField("Search product", text: $inputText)
                .padding(.vertical, 10)
                .frame(height: 24)
                .padding(.vertical, 14)
                .foregroundColor(Color("blackApp"))
            
            if (!inputText.isEmpty) {
                Button {
                    inputText = ""
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(Color("blackApp"))
                        .frame(width: 24, height: 24)
                        .padding(.vertical, 14)
                }
            }
        }
        .padding(.horizontal)
        .background(Color(.white))
        .cornerRadius(6)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(inputText: .constant(""))
    }
}
