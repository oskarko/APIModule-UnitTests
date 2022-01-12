//
//  SignInResponse.swift
//  CallToAPI
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

import Foundation

struct SignInResponse: Codable {
    var token: String
    var username: String

    enum CodingKeys: String, CodingKey {
        case token
        case username
    }
}
