//
//  ProgressBar.swift
//  E Commerce App
//
//  Created by Olsera on 07/09/23.
//

import SwiftUI

struct ProgressBar: View {
    var progress: Double // Progress dalam bentuk nilai antara 0.0 dan 1.0
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: geometry.size.width, height: 10)
                    .cornerRadius(5)
                    .foregroundColor(Color("primaryApp"))
                    .opacity(0.3)
                
                Rectangle()
                    .frame(width: CGFloat(self.progress) * geometry.size.width, height: 10)
                    .cornerRadius(5)
                    .foregroundColor(Color("primaryApp"))
            }
        }
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar(progress: 0.5)
    }
}
