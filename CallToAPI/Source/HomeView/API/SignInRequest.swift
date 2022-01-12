//
//  SignInRequest.swift
//  CallToAPI
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

import Foundation

struct SignInRequest: APIRequest {
    var url: URL {
        APIURL.dev.convertedURL
    }
    
    var path: APIPath {
        .signin
    }
    
    var queryItems: [URLQueryItem]?
    
    var method: HTTPMethod {
        .post
    }
    
    var params: Any? {
        var dictionary = [String: String]()
        dictionary["email"] = email
        dictionary["password"] = password
        
        return dictionary
    }
    
    var timeoutInterval: TimeInterval {
        10.0
    }
    
    var email: String
    var password: String
}
