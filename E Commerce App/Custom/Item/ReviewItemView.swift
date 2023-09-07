//
//  ReviewItemView.swift
//  E Commerce App
//
//  Created by Olsera on 07/09/23.
//

import SwiftUI

struct ReviewItemView: View {
    let comment: Comment
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(comment.user.username)
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundColor(Color("blackApp"))
                
                Spacer()
                
                Text(Comment.generateDate())
                    .font(.system(size: 12))
                    .foregroundColor(Color.secondary)
            }
            
            
            HStack {
                ForEach(0..<5) { index in
                    Image(systemName: index < Int(Comment.generateRating()) ? "star.fill" : "star")
                        .foregroundColor(Color("primaryApp"))
                        .imageScale(.small)
                }
            }
            
            Text(comment.body)
                .font(.system(size: 12))
                .foregroundColor(Color.secondary)
                .frame(width: 160, alignment: .leading)
        }
        .padding(10)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 4)
    }
}

struct ReviewItemView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewItemView(comment: Comment.dummyComment())
    }
}
