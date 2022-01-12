//
//  NetworkRequest.swift
//  CallToAPI
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2021 Oscar R. Garrucho. All rights reserved.
//

import Foundation

struct NetworkRequest {
    var request: URLRequest
    
    init(apiRequest: APIRequest) {
        var urlComponents = URLComponents(string: apiRequest.url.description)

        urlComponents?.path = apiRequest.path.rawValue
        urlComponents?.queryItems = apiRequest.queryItems
        
        guard let fullURL = urlComponents?.url else {
            assertionFailure("Couldnt build the URL")
            request = URLRequest(url: URL(string: "")!)
            return
        }
        
        request = URLRequest(url: fullURL)
        request.httpMethod = apiRequest.method.rawValue
        request.timeoutInterval = apiRequest.timeoutInterval
        if let token = UserDefaults.standard.string(forKey: "auth.key.token") {
            request.addValue(token, forHTTPHeaderField: "x-access-token")
        }
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("*/*", forHTTPHeaderField: "Accept")
        
        if let params = apiRequest.params, (apiRequest.method == .post || apiRequest.method == .patch) {
            let jsonData = try! JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
            request.httpBody = jsonData
        }
    }
}
