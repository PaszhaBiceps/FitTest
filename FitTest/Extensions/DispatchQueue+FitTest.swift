//
//  DispatchQueue+FitTest.swift
//  FitTest
//
//  Created by Pavel Borisov on 1/21/19.
//  Copyright © 2019 Pavel Borisov. All rights reserved.
//

import Foundation

extension DispatchQueue {
    /**
     Executes the closure on the main queue after a set amount of seconds.
     
     - parameter delay:   Delay in seconds
     - parameter closure: Code to execute after delay
     **/
    static func delayOnMainQueue(_ delay: Double, closure: @escaping ()->()) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
    }
    
    /**
     Executes the closure on a background queue after a set amount of seconds.
     
     - parameter delay:   Delay in seconds
     - parameter closure: Code to execute after delay
     **/
    static func delayOnBackgroundQueue(_ delay: Double, closure: @escaping ()->()) {
        DispatchQueue.global(qos: DispatchQoS.QoSClass.utility).asyncAfter(deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
    }
}
