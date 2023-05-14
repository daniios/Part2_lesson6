//
//  User.swift
//  Part2_lesson6
//
//  Created by Даниил Чупин on 14.05.2023.
//

import Foundation

struct User: Codable {
    let username: String
    var password: String
    var name: String
    var age: Int
    var email: String
    var workExperience: String
    var education: String
    var skills: [String]
    var address: String
    var phoneNumber: String
    var portfolio: String
    var certificates: [String]
    var interests: [String]
    
    func toData() -> Data? {
        let encoder = JSONEncoder()
        return try? encoder.encode(self)
    }
    
    static func fromData(_ data: Data) -> User? {
        let decoder = JSONDecoder()
        return try? decoder.decode(User.self, from: data)
    }
}
