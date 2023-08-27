//
//  FloatingNavBar.swift
//  E Commerce App
//
//  Created by Olsera on 19/08/23.
//

import SwiftUI

enum Tabs: Int {
    case home = 0
    case category = 1
    case wishlist = 2
    case user = 3
}


struct FloatingNavBar: View {
    @Binding var selectedTab: Tabs
    
    var body: some View {
    
        GeometryReader { geometry in
            VStack {
                Spacer()
                HStack(spacing: 16)  {
                    Spacer()
                    Button {
                        selectedTab = .home
                    } label: {
                        NavBarButton(imageActive: "house.fill", imageUnactive: "house", isActive: selectedTab == .home)
                    }
                    Spacer()
                    Button {
                        selectedTab = .category
                    } label: {
                        NavBarButton(imageActive: "square.grid.2x2.fill", imageUnactive: "square.grid.2x2", isActive: selectedTab == .category)
                    }
                    Spacer()
                    Button {
                        selectedTab = .wishlist
                    } label: {
                        NavBarButton(imageActive: "heart.fill", imageUnactive: "heart", isActive: selectedTab == .wishlist)
                    }
                    Spacer()
                    Button {
                        selectedTab = .user
                    } label: {
                        NavBarButton(imageActive: "person.fill", imageUnactive: "person", isActive: selectedTab == .user)
                    }
                    Spacer()
                }
                .padding()
                .background(Color.black.opacity(0.7))
                .cornerRadius(10)
                .padding(20)
                .frame(width: geometry.size.width)
            }
        }
    }
}

struct FloatingNavBar_Previews: PreviewProvider {
    static var previews: some View {
        FloatingNavBar(selectedTab: .constant(.home))
    }
}
