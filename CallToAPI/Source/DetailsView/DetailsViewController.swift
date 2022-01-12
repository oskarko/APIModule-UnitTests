//  DetailsViewController.swift
//  CallToAPI
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2021 Oscar R. Garrucho. All rights reserved.
//

import UIKit

protocol DetailsViewControllerProtocol: AnyObject {
    func reload()
    func showError(message: String)
}

class DetailsViewController: UIViewController {
    
    // MARK: - Properties
    
    var viewModel: DetailsViewModel!
    
    @IBOutlet weak var goBackButton: UIButton!
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        viewModel.viewDidLoad()
    }
    
    // MARK: - Selectors
    
    @IBAction func goBackButtonTapped(_ sender: UIButton) {
        viewModel.goBackButtonTapped()
    }
    
    // MARK: - Helpers

    private func configureUI() {
        view.backgroundColor = .white
    }
    
}

// MARK: - DetailsViewControllerProtocol

extension DetailsViewController: DetailsViewControllerProtocol {
    func reload() {
        print("reloadData - \(viewModel.numberOfPosts)")
    }
    
    func showError(message: String) {
        print("error - \(message)")
    }
}
