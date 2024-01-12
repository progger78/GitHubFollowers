//
//  User.swift
//  GHFollowers
//
//  Created by 1 on 10.01.2024.
//

import Foundation


struct User: Decodable {
    let login: String
    let avaratarUrl: String
    var name: String?
    var location: String?
    var bio: String?
    let publicRepos: Int
    let publicGists: Int
    let htmlUrl: String
    let followers: Int
    let following: Int
    let createdAt: String
}
