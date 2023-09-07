//
//  DetailReviewsScreen.swift
//  E Commerce App
//
//  Created by Olsera on 07/09/23.
//

import SwiftUI

struct DetailReviewsScreen: View {
    let comments: [Comment]
    var body: some View {
        let totalRatings = 100
        let dummyRatings = Comment.generateDummyRatings(totalRatings: totalRatings)
        
        ScrollView {
            VStack {
                Text("Ratings & Reviews")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(Color("blackApp"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack {
                    VStack {
                        Text(String(format: "%.1f", Comment.getAverageRating(dummyRatings: dummyRatings)))
                            .font(.system(size: 43, weight: .bold))
                            .foregroundColor(Color("primaryApp"))
                            .frame(alignment: .center)

                            Text("Out of 5")
                                .font(.system(size: 14, weight: .bold))
                                .foregroundColor(Color("primaryApp"))
                                .frame(alignment: .center)
                    }
                    
                    VStack(alignment: .trailing, spacing: 10) {
                        ForEach(dummyRatings.sorted(by: { $0.key > $1.key }), id: \.key) { (rating, count) in
                            HStack {
                                HStack {
                                    ForEach(0..<rating) { index in
                                        Image(systemName: "star.fill")
                                            .foregroundColor(Color("primaryApp"))
                                            .font(.system(size: 12))
                                        
                                    }
                                }
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                HStack {
                                    let progress = Comment.divideIntegers(count, 50)
                                    ProgressBar(progress: progress)
                                    Text("\(Int(count))")
                                        .font(.system(size: 14, weight: .bold))
                                        .foregroundColor(Color("primaryApp"))
                                }
                            }
                            
                        }
                    }
                    
                }
                .padding(.horizontal)
                LazyVStack {
                    ForEach(comments, id: \.id) { comment in
                        ReviewItemView(comment: comment)
                    }
                    .padding(.vertical, 5)
                }
                .padding(.horizontal, 5)
                
            }
        }
    }
}

struct DetailReviewsScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailReviewsScreen(comments: Comment.dummyComments())
    }
}
