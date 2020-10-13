//
//  User.swift
//  TurnipNet
//
//  Created by Rodrigo Lucero on 10/13/20.
//

import Foundation

struct User: Codable, Identifiable {
    let id = UUID();
    let userId: Int
    let username: String
    let email: String
    let password: String
    
    enum CodingKeys: String, CodingKey {
        case userId = "id"
        case username
        case email
        case password
    }
}
