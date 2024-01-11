//
//  User.swift
//  GHFollowers
//
//  Created by 1 on 10.01.2024.
//

import Foundation


struct User: Decodable {
    var login: String
    var avaratarUrl: String
    var name: String?
    var location: String?
    var bio: String?
    var publicRepos: Int
    var publicGists: Int
    var htmlUrl: String
    var followers: Int
    var following: Int
    var createdAt: String
}
