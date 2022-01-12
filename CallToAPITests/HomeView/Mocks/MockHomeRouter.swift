//
//  MockHomeRouter.swift
//  CallToAPITests
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

@testable import CallToAPI

class MockHomeRouter: HomeRouter {

    var isShowDetailsViewPresent = false
    
    override func showDetailsView() {
        isShowDetailsViewPresent = true
    }
}
