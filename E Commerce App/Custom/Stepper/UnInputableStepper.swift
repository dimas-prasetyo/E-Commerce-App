//
//  UnInputableStepper.swift
//  E Commerce App
//
//  Created by Olsera on 13/09/23.
//

import SwiftUI

struct UnInputableStepper: View {
    @Binding var input: Int
    var body: some View {
        HStack {
            Button {
                if input > 0 {
                    input = input - 1
                }
            } label: {
                Image(systemName: "minus")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 10, height: 10)
                    .font(.system(size: 10, weight: .bold))
                    .foregroundColor(Color.white)
            }
            
            Text("\(input)")
                .font(.system(size: 14, weight: .semibold))
                .padding(.horizontal, 10)
                .foregroundColor(Color.white)
                .frame(minWidth: 40)
            
            Button {
                input = input + 1
            } label: {
                Image(systemName: "plus")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 12, height: 12)
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(Color.white)
            }
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
        .background(Color("blackApp"))
        .cornerRadius(5)
    }
}

struct UnInputableStepper_Previews: PreviewProvider {
    static var previews: some View {
        UnInputableStepper(input: .constant(10))
    }
}
