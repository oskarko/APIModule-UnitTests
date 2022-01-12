//
//  MockDetailsView.swift
//  CallToAPITests
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

@testable import CallToAPI

class MockDetailsView: DetailsViewControllerProtocol {
    
    var viewModel: DetailsViewModel!
    var errorMessage: String?
    var isReloaded: Bool = false
    
    func reload() {
        isReloaded = true
    }
    func showError(message: String) {
        errorMessage = message
    }
    
}
