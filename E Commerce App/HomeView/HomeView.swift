//
//  HomeView.swift
//  E Commerce App
//
//  Created by Olsera on 19/08/23.
//

import SwiftUI

struct HomeView: View {
    @State var selectedTab: Tabs = .home
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        ZStack {
            
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
                
            }
            
            VStack {
                if viewModel.showFloatingNavbar {
                    FloatingNavBar(selectedTab: $selectedTab)
                }
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color("backgroundApp"))
        .environmentObject(viewModel)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
