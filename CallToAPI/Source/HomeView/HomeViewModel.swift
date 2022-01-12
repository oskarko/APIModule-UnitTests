//  HomeViewModel.swift
//  CallToAPI
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2021 Oscar R. Garrucho. All rights reserved.
//

import Foundation

class HomeViewModel {
    
    // MARK: - Properties
    
    weak var view: HomeViewControllerProtocol?
    var router: HomeRouter?
    
    private var signinService: SignInServiceProtocol
    
    // MARK: - Lifecycle
    
    init(_ signinService: SignInServiceProtocol = SignInService()) {
        self.signinService = signinService
    }
    
    // MARK: - Helpers
    
    func signInButtonTapped() {
        signinService.signIn(with: "", password: "") { [weak self] result in
            guard let self = self else { return }
            
            switch result {
                case .success(let signInResponse):
                    UserDefaults.standard.set(signInResponse.token, forKey: "auth.key.token")
                    self.router?.showDetailsView()
                case .failure(let error):
                    self.view?.showError(message: error.localizedDescription)
            }
        }
    }
    
}
