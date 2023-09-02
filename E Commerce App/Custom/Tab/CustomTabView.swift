//
//  CustomTabView.swift
//  E Commerce App
//
//  Created by Olsera on 02/09/23.
//

import SwiftUI

struct CustomTabView: View {
    @State private var selectedTab = 0
    let tabItems: [TabItem]
    
    var body: some View {
        VStack {
            HStack{
                Spacer()
                ForEach(0..<tabItems.count, id: \.self) { index in
                    Button {
                        selectedTab = index
                    } label: {
                        TabTextButton(text: tabItems[index].title, isSelected: selectedTab == index)
                    }
                }
                Spacer()
                
            }
            .padding(.vertical)
            
            tabItems[selectedTab].content
            
            
//            TabView(selection: $selectedTab) {
//                ForEach(0..<tabItems.count, id: \.self) { index in
//                    tabItems[index].content
//                        .tabItem {
//
//                        }
//                        .tag(index)
//                }
//            }
//            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        
        }
        .padding(10)
        .background(Color.white)
        .cornerRadius(10)
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView(tabItems: TabItem.getDetailProductTabView())
            .environmentObject(DetailProductViewModel())
    }
}
