//
//  HomeViewModel.swift
//  FitTest
//
//  Created by Pavel Borisov on 1/19/19.
//  Copyright © 2019 Pavel Borisov. All rights reserved.
//

import Foundation
import UIKit

class HomeViewModel {
    
    init() {}
    
    // MARK: - Variables
    private var models: [EntityModel] = [] {
        didSet {
            self.refreshControl.endRefreshing()
            self.dataFinishedUpdatingBlock?()
        }
    }
    private let refreshControl = UIRefreshControl()
    private let homeTableCellHeight: CGFloat = 70.0
    private let refreshControlTitle = "Updating..."
    private let dataDelay: Double = 2.0
    
    // MARK: - Blocks
    var dataStartedUpdatingBlock: (() -> ())?
    var dataFinishedUpdatingBlock: (() -> ())?
    
    // MARK: - Functions
    func initialConfigration(completion: (_ refreshControl: UIRefreshControl, _ cellHeight: CGFloat) -> Void) {
        self.refreshControl.attributedTitle = NSAttributedString(string: self.refreshControlTitle)
        self.refreshControl.addTarget(self, action: #selector(self.refreshData(_:)), for: .valueChanged)
        completion(self.refreshControl, self.homeTableCellHeight)
    }
    
    func refreshData() {
        self.dataStartedUpdatingBlock?()
        DispatchQueue.delayOnMainQueue(self.dataDelay) {[weak self] () in
            guard let self = self else { return }
            self.modelsFromFile()
        }
    }
    
    func data() -> [EntityModel] {
        return self.models
    }
    
    // MARK: - Private
    private func modelsFromFile() {
        let rawModels = CSVParser.shared.csvContents()
        var entityModels: [EntityModel] = []
        for rawModel in rawModels {
            entityModels.append(EntityModel(with: rawModel))
        }
        self.models = entityModels
    }
    
    // MARK: - Selectors
    @objc func refreshData(_ refreshControl: UIRefreshControl) {
        DispatchQueue.delayOnMainQueue(self.dataDelay) {[weak self] () in
            guard let self = self else { return }
            self.modelsFromFile()
        }
    }
}
