//
//  APIURL.swift
//  CallToAPI
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2021 Oscar R. Garrucho. All rights reserved.
//

import Foundation

enum APIURL: String {
    case prod = ""
    case dev = ""
    
    var convertedURL: URL {
        guard let url = URL(string: self.rawValue) else {
            assertionFailure("Incorrect format of URL")
            return URL(string: "")!
        }
        return url
    }
}
