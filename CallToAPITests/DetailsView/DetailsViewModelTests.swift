//
//  DetailsViewModelTests.swift
//  CallToAPITests
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

@testable import CallToAPI
import XCTest

class DetailsViewModelTests: XCTestCase {

    var detailsView: MockDetailsView!
    var detailsViewModel: DetailsViewModel!
    var explorerService: MockExplorerService!
    var detailsRouter: MockDetailsRouter!
    
    override func setUp() {
        detailsView = MockDetailsView()
        explorerService = MockExplorerService()
        detailsViewModel = DetailsViewModel(explorerService)
        detailsRouter = MockDetailsRouter()
        
        detailsView.viewModel = detailsViewModel
        
        detailsViewModel.view = detailsView
        detailsViewModel.router = detailsRouter
    }
    
    override func tearDown() {
        detailsView = nil
        detailsViewModel = nil
        explorerService = nil
        detailsRouter = nil
    }

    func test_viewDidLoad_withSuccess() throws {
        // Given
        explorerService.success = true
        
        // When
        detailsViewModel.viewDidLoad()
        
        // Then
        XCTAssertNil(detailsView.errorMessage)
        XCTAssertTrue(detailsView.isReloaded == true)
    }
    
    func test_viewDidLoad_withError() throws {
        // Given
        explorerService.success = false
        
        // When
        detailsViewModel.viewDidLoad()
        
        // Then
        XCTAssertNotNil(detailsView.errorMessage)
        XCTAssertTrue(detailsView.errorMessage == "MockExplorerService error")
    }
    
    func test_goBackButtonTapped() throws {
        // Given
        detailsRouter.isDetailsPopBack = false
        
        // When
        detailsViewModel.goBackButtonTapped()
        
        // Then
        XCTAssertTrue(detailsRouter.isDetailsPopBack == true)
    }
}
