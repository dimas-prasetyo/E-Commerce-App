//
//  CheckBox.swift
//  E Commerce App
//
//  Created by Olsera on 13/09/23.
//

import SwiftUI

struct CheckBox: View {
    @Binding var isChecked: Bool
    var body: some View {
        Button {
            isChecked.toggle()
        } label: {
            HStack {
                Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(isChecked ? Color("primaryApp") : .gray)
            }
            .padding(5)
        }
    }
}

struct CheckBox_Previews: PreviewProvider {
    static var previews: some View {
        CheckBox(isChecked: .constant(true))
    }
}
