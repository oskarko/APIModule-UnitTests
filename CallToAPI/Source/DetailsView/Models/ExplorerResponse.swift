//
//  ExplorerResponse.swift
//  CallToAPI
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

import Foundation

struct ExplorerResponse: Codable {
    var posts: [Post]
    var last: String

    enum CodingKeys: String, CodingKey {
        case posts
        case last
    }
}
