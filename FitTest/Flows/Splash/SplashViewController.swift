//
//  SplashViewController.swift
//  FitTest
//
//  Created by Pavel Borisov on 1/18/19.
//  Copyright © 2019 Pavel Borisov. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    
    // MARK: - Variables
    private let viewModel = SplashViewModel()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
        self.viewModel.proceedToHome {[weak self] (viewController) in
            guard let self = self else { return }
            self.navigationController?
                .pushViewController(viewController,
                                    animated: true)
        }
    }
}
