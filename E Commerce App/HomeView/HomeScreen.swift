//
//  HomeScreen.swift
//  E Commerce App
//
//  Created by Olsera on 19/08/23.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.products.pr) { product in
                Text("twj")
            }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
