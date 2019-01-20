//
//  UIViewController+FitTest.swift
//  FitTest
//
//  Created by Pavel Borisov on 1/19/19.
//  Copyright © 2019 Pavel Borisov. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    class func initWithNib<T : UIViewController>() -> T {
        return self.init(nibName: String(describing: self.classForCoder()), bundle: nil) as! T
    }
}
