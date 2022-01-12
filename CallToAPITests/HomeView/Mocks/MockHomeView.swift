//
//  MockHomeView.swift
//  CallToAPITests
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

@testable import CallToAPI

class MockHomeView: HomeViewControllerProtocol {
    
    var viewModel: HomeViewModel!
    var errorMessage: String?
    
    func showError(message: String) {
        errorMessage = message
    }
    
}
