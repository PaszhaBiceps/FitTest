//
//  SplashViewModel.swift
//  FitTest
//
//  Created by Pavel Borisov on 1/19/19.
//  Copyright © 2019 Pavel Borisov. All rights reserved.
//

import Foundation
import UIKit

class SplashViewModel {
    
    init() {}
    
    // MARK: - Variables
    private let splashDelay: Double = 2.0
    
    // MARK: - Functions
    func proceedToHome(completion: @escaping (_ homeViewController: UIViewController) -> Void) {
        DispatchQueue.delayOnMainQueue(self.splashDelay) {
            completion(ViewControllers.home.initWithNib())
        }
    }
}
