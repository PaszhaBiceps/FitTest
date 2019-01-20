//
//  HomeViewController.swift
//  FitTest
//
//  Created by Pavel Borisov on 1/19/19.
//  Copyright © 2019 Pavel Borisov. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            self.tableView.register(UINib(nibName: CellIdentifiers.TableView.homeCell, bundle: nil), forCellReuseIdentifier: CellIdentifiers.TableView.homeCell)
        }
    }
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialize()
    }
    
    // MARK: - Functions
    private func initialize() {
        self.bindBlocks()
        self.viewModel.initialConfigration {[weak self] (refreshControl, cellHeight) in
            guard let self = self else { return }
            self.tableView.rowHeight = cellHeight
            self.tableView.addSubview(refreshControl)
        }
        self.viewModel.refreshData()
    }
    
    private func bindBlocks() {
        self.viewModel.dataStartedUpdatingBlock = {[weak self] () in
            guard let self = self else { return }
            self.activityIndicator.startAnimating()
        }
        
        self.viewModel.dataFinishedUpdatingBlock = {[weak self] () in
            guard let self = self else { return }
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
            self.tableView.isHidden = false
            self.tableView.reloadData()
        }
    }

    // MARK: - UITableView delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.data().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.TableView.homeCell, for: indexPath) as? HomeTableViewCell else {
            print("Couldn't dequeque home cell!")
            return UITableViewCell()
        }
        cell.configure(with: self.viewModel.data()[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
}
