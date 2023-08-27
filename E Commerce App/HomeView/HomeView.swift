//
//  HomeView.swift
//  E Commerce App
//
//  Created by Olsera on 19/08/23.
//

import SwiftUI

struct HomeView: View {
    @State var selectedTab: Tabs = .home
    
    var body: some View {
        
        NavigationView {
            ZStack {
                Color.white
                
                VStack {
                    switch selectedTab {
                    case .home:
                        HomeScreen()
                        
                    case .category:
                        CategoryScreen()
                    
                    case .wishlist:
                        WishListsScreen()
                        
                    case .user:
                        ProfileScreen()
                        
                    }
                    
                    FloatingNavBar(selectedTab: $selectedTab)
                }
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
