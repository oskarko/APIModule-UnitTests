//  DetailsViewModel.swift
//  CallToAPI
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2021 Oscar R. Garrucho. All rights reserved.
//

import Foundation

class DetailsViewModel {
    
    // MARK: - Properties
    
    weak var view: DetailsViewControllerProtocol?
    var router: DetailsRouter?
    
    private var explorerService: ExplorerServiceProtocol
    private var posts: [Post]?
    
    var numberOfPosts: Int {
        posts?.count ?? 0
    }
    
    // MARK: - Lifecycle
    
    init(_ explorerService: ExplorerServiceProtocol = ExplorerService()) {
        self.explorerService = explorerService
    }
    
    // MARK: - Helpers
    
    func viewDidLoad() {
        explorerService.getPosts(type: .all, limit: 10) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
                case .success(let explorerResponse):
                    self.posts = explorerResponse.posts
                    self.view?.reload()
                case .failure(let error):
                    self.view?.showError(message: error.localizedDescription)
            }
        }
    }
    
    func goBackButtonTapped() {
        router?.goBack()
    }
    
}
