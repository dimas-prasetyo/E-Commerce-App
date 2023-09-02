//
//  BackButton.swift
//  E Commerce App
//
//  Created by Olsera on 01/09/23.
//

import SwiftUI

struct BackButton: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
                HStack(alignment: .center, spacing: 0) {
                    Image(systemName: "arrow.backward")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .foregroundColor(Color("blackApp"))
                }
                .padding(12)
                .background(Color.white)
                .cornerRadius(6)
        }
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton()
    }
}
