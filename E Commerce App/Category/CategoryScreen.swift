//
//  CategoryScreen.swift
//  E Commerce App
//
//  Created by Olsera on 19/08/23.
//

import SwiftUI

struct CategoryScreen: View {
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Spacer()
                    BoxIconButton(buttonIcon: "cart", iconSize: 24, isSelected: false)
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 12)
                Spacer()
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
