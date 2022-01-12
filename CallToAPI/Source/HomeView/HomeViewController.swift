//  HomeViewController.swift
//  CallToAPI
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2021 Oscar R. Garrucho. All rights reserved.
//

import UIKit

protocol HomeViewControllerProtocol: AnyObject {
    func showError(message: String)
}

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    
    var viewModel: HomeViewModel!
    
    @IBOutlet weak var signInButton: UIButton!
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    

    // MARK: - Selectors

    @IBAction func signInButtonTapped(_ sender: UIButton) {
        viewModel.signInButtonTapped()
    }
    
    // MARK: - Helpers

    private func configureUI() {
        view.backgroundColor = .white
    }
    
}

// MARK: - HomeViewControllerProtocol

extension HomeViewController: HomeViewControllerProtocol {
    func showError(message: String) {
        print("error - \(message)")
    }
}
