//
//  HomeService.swift
//  CallToAPI
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

import Foundation

protocol SignInServiceProtocol {
    func signIn(with email: String, password: String, completionHandler: @escaping (Result<SignInResponse, Error>) -> Void)
}

final class SignInService: SignInServiceProtocol {
    private let networkRequester: NetworkRequester
    
    init(networkRequester: NetworkRequester = .init()) {
        self.networkRequester = networkRequester
    }
    
    func signIn(with email: String, password: String, completionHandler: @escaping (Result<SignInResponse, Error>) -> Void) {
        let request = SignInRequest(email: email, password: password)
        
        networkRequester.requestService(request: NetworkRequest(apiRequest: request), completion: { (result: Result<SignInResponse, Error>) in
            switch result {
            case .success(let response):
                completionHandler(.success(response))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        })
    }
}
