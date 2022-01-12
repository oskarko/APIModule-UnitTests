//
//  MockSignInService.swift
//  CallToAPITests
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

@testable import CallToAPI

class MockSignInService: SignInServiceProtocol {
    
    var success: Bool = true
    
    func signIn(with email: String, password: String, completionHandler: @escaping (Result<SignInResponse, Error>) -> Void) {
        if success {
            let response = SignInResponse(token: "mock token", username: "mockUsername")
            completionHandler(.success(response))
        } else {
            let error: APIError = .default(description: "MockSignInService error")
            completionHandler(.failure(error))
        }
    }
}
