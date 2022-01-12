//
//  ExplorerRequest.swift
//  CallToAPI
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

import Foundation

struct ExplorerRequest: APIRequest {
    var url: URL {
        APIURL.dev.convertedURL
    }
    
    var path: APIPath {
        .discover
    }
    
    var queryItems: [URLQueryItem]? {
        var items = [URLQueryItem]()
        items.append(URLQueryItem(name: "contentType", value: type.rawValue))
        items.append(URLQueryItem(name: "num", value: "\(limit)"))
        
        return items
    }
    
    var method: HTTPMethod {
        .get
    }
    
    var params: Any? {
        let dictionary = [String: String]()
        
        return dictionary
    }
    
    var timeoutInterval: TimeInterval {
        10.0
    }
    
    var type: PostType
    var limit: Int
}
