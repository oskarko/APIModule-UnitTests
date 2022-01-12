//
//  Post.swift
//  CallToAPI
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

import Foundation

struct Post: Codable {
    //let user: User?
    let postId: String?
    let baseUrl: String?
    let url: String?
    let numLikes: Int?
    let numComments: Int?
    let isLiked: Bool?
    
    enum CodingKeys: String, CodingKey {
        case postId
        case baseUrl
        case url
        case numLikes
        case numComments
        case isLiked
    }
}
