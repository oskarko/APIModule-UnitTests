//
//  HomeViewModelTests.swift
//  CallToAPITests
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

@testable import CallToAPI
import XCTest

class HomeViewModelTests: XCTestCase {

    var homeView: MockHomeView!
    var homeViewModel: HomeViewModel!
    var signInService: MockSignInService!
    var homeRouter: MockHomeRouter!
    
    override func setUp() {
        homeView = MockHomeView()
        signInService = MockSignInService()
        homeViewModel = HomeViewModel(signInService)
        homeRouter = MockHomeRouter()
        
        homeView.viewModel = homeViewModel
        
        homeViewModel.view = homeView
        homeViewModel.router = homeRouter
    }
    
    override func tearDown() {
        homeView = nil
        homeViewModel = nil
        signInService = nil
        homeRouter = nil
    }
    
    func test_signInButtonTapped_withSuccess() throws {
        // Given
        signInService.success = true
        
        // When
        homeViewModel.signInButtonTapped()
        
        // Then
        XCTAssertNil(homeView.errorMessage)
        XCTAssertTrue(homeRouter.isShowDetailsViewPresent == true)
    }
    
    func test_signInButtonTapped_withError() throws {
        // Given
        signInService.success = false
        
        // When
        homeViewModel.signInButtonTapped()
        
        // Then
        XCTAssertNotNil(homeView.errorMessage)
        XCTAssertTrue(homeView.errorMessage == "MockSignInService error")
    }
}
