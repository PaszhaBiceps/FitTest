//
//  Collection+FitTest.swift
//  FitTest
//
//  Created by Pavel Borisov on 1/21/19.
//  Copyright © 2019 Pavel Borisov. All rights reserved.
//

import Foundation

extension Collection {
    subscript(safe index: Index) -> Iterator.Element? {
        return self.indices.contains(index) ? self[index] : nil
    }
}
