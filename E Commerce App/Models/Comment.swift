//
//  Comment.swift
//  E Commerce App
//
//  Created by Olsera on 06/09/23.
//

import Foundation

struct Comment: Codable, CustomStringConvertible, Identifiable {
    let id: Int
    let body: String
    let postId: Int
    let user: User
    
    var description: String {
        return "getComment"
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case body
        case postId
        case user
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        body = try values.decode(String.self, forKey: .body)
        postId = try values.decode(Int.self, forKey: .postId)
        user = try values.decode(User.self, forKey: .user)
        //userComment = try values.decode(UserComment.self, forKey: .user)
    }
    
    init(id: Int, body: String, postId: Int, user: User) {
        self.id = id
        self.body = body
        self.postId = postId
        self.user = user
    }
    
    struct User: Codable {
        let id: Int
        let username: String
    }
    
    static func dummyComments() -> [Comment] {
        return [
            Comment(id: 85, body: "I love your creativity!", postId: 10, user: User(id: 98, username: "zstenning2p")),
            Comment(id: 164, body: "The expression is lovely.", postId: 10, user: User(id: 98, username: "zstenning2p")),
            Comment(id: 331, body: "Irresistible!", postId: 10, user: User(id: 73, username: "wfeldon20")),
        ]
    }
    
    static func dummyComment() -> Comment {
        return Comment(id: 85, body: "I love your creativity!", postId: 10, user: User(id: 98, username: "zstenning2p"))
    }
    
    static func generateDummyRatings(totalRatings: Int) -> [Int: Int] {
        var ratingsDistribution: [Int: Int] = [:]
        
        let highRatingProbability = 0.7
        let lowRatingProbability = (1.0 - highRatingProbability) / 2.0
        
        for _ in 0..<totalRatings {
            let randomNumber = Double.random(in: 0..<1)
            var rating: Int
            
            if randomNumber <= highRatingProbability {
                rating = Int.random(in: 4...5)
            } else if randomNumber <= highRatingProbability + lowRatingProbability {
                rating = Int.random(in: 2...3)
            } else {
                rating = 1
            }
            
            if let count = ratingsDistribution[rating] {
                ratingsDistribution[rating] = count + 1
            } else {
                ratingsDistribution[rating] = 1
            }
        }
        
        return ratingsDistribution
    }
    
    static func getAverageRating(dummyRatings: [Int: Int]) -> Double {
        var totalRatingSum = 0
        var totalVotes = 0
        
        for (rating, count) in dummyRatings {
            totalRatingSum += rating * count
            totalVotes += count
        }
        
        if totalVotes == 0 {
            return 0.0 // Hindari pembagian oleh nol
        }
        
        let averageRating = Double(totalRatingSum) / Double(totalVotes)
        return averageRating
    }
    
    static func generateRating() -> Double {
        return Double.random(in: 3.0...4.9)
    }
    
    static func generateDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd, MMM yyyy"

        let randomYear = Int.random(in: 2020...2023)
        let randomMonth = Int.random(in: 1...12)
        let randomDay = Int.random(in: 1...28)

        if let randomDate = Calendar.current.date(from: DateComponents(year: randomYear, month: randomMonth, day: randomDay)) {
            return dateFormatter.string(from: randomDate)
        } else {
            return "Tanggal tidak valid"
        }
    }
    
    static func divideIntegers(_ numerator: Int, _ denominator: Int) -> Double {
        return Double(numerator) / Double(denominator)
    }
}
