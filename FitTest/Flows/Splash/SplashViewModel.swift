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
    
    // MARK: - Functions
    func proceedToHome(compeltion: @escaping (_ homeViewController: UIViewController) -> Void) {
        DispatchQueue.delayOnMainQueue(2) {
            compeltion(ViewControllers.home.initWithNib())
        }
    }
}
