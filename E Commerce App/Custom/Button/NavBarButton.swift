//
//  NavBarButton.swift
//  E Commerce App
//
//  Created by Olsera on 19/08/23.
//

import SwiftUI

struct NavBarButton: View {
    var imageActive: String
    var imageUnactive: String
    var isActive: Bool
    
    var body: some View {
        VStack(alignment: .center, spacing: 4) {
            Image(systemName: isActive ? imageActive : imageUnactive)
                .resizable()
                .scaledToFit()
                .frame(width: isActive ? 25 : 24, height: isActive ? 25 : 24)
                .tint(.white)
        }
    }
}

struct NavBarButton_Previews: PreviewProvider {
    static var previews: some View {
        NavBarButton(imageActive: "house.fill", imageUnactive: "house",isActive: true)
    }
}
