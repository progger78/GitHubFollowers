//
//  Follower.swift
//  GHFollowers
//
//  Created by 1 on 10.01.2024.
//

import Foundation

struct Follower: Decodable, Hashable, Encodable{
    var login: String
    var avatarUrl: String
}
