//
//  EntityModel.swift
//  FitTest
//
//  Created by Pavel Borisov on 1/19/19.
//  Copyright © 2019 Pavel Borisov. All rights reserved.
//

import Foundation
import UIKit

class EntityModel {
    
    var title: String?
    var subtitle: String?
    var amount: Double?
    var image: UIImage?
    
    init() {}
    
    convenience init(with data: [String]) {
        self.init()
        
        if data.count > 0 {
            self.title = data[0]
            self.subtitle = data[1]
            self.amount = Double(data[2])
            
            if let title = self.title {
                self.image = UIImage(named: title)
            }
        }
    }
}
