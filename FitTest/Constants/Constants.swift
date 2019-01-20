//
//  Constants.swift
//  FitTest
//
//  Created by Pavel Borisov on 1/18/19.
//  Copyright © 2019 Pavel Borisov. All rights reserved.
//

import Foundation

// MARK: - Dispatch wrapper
/**
 Executes the closure on the main queue after a set amount of seconds.
 
 - parameter delay:   Delay in seconds
 - parameter closure: Code to execute after delay
 **/
func delayOnMainQueue(_ delay: Double, closure: @escaping ()->()) {
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
}

/**
 Executes the closure on a background queue after a set amount of seconds.
 
 - parameter delay:   Delay in seconds
 - parameter closure: Code to execute after delay
 **/
func delayOnBackgroundQueue(_ delay: Double, closure: @escaping ()->()) {
    DispatchQueue.global(qos: DispatchQoS.QoSClass.utility).asyncAfter(deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
}

// MARK: - Constants
struct ViewControllers {
    static let splash = SplashViewController.self
    static let home = HomeViewController.self
}

struct CellIdentifiers {
    struct TableView {
        static let homeCell = "HomeTableViewCell"
    }
}
