//
//  ExplorerService.swift
//  CallToAPI
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

import Foundation

protocol ExplorerServiceProtocol {
    func getPosts(type: PostType, limit: Int, completionHandler: @escaping (Result<ExplorerResponse, Error>) -> Void)
}

final class ExplorerService: ExplorerServiceProtocol {
    private let networkRequester: NetworkRequester
    
    init(networkRequester: NetworkRequester = .init()) {
        self.networkRequester = networkRequester
    }
    
    func getPosts(type: PostType, limit: Int, completionHandler: @escaping (Result<ExplorerResponse, Error>) -> Void) {
        let request = ExplorerRequest(type: type, limit: limit)
        
        networkRequester.requestService(request: NetworkRequest(apiRequest: request), completion: { (result: Result<ExplorerResponse, Error>) in
            switch result {
            case .success(let response):
                completionHandler(.success(response))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        })
    }
}
